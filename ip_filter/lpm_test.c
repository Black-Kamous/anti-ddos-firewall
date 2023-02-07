/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"
#define MAX_SUFFIX_LENGTH 50
#define MAX_SUFFIX_NUM 100
#define bpf_printk(fmt, ...)				\
({                                                      \
        char ____fmt[] = fmt;                           \
        bpf_trace_printk(____fmt, sizeof(____fmt),      \
                         ##__VA_ARGS__);                \
})

struct ipv4_lpm_key {
        __u32 prefixlen;
        __u8 data[16];
};

struct {
        __uint(type, BPF_MAP_TYPE_LPM_TRIE);
        __type(key, struct ipv4_lpm_key);
        __type(value, __u32);
        __uint(map_flags, BPF_F_NO_PREALLOC);
        __uint(max_entries, 255);
} dns_block_suffixes SEC(".maps");

static __always_inline int parse_iphdr_saddr(struct hdr_cursor *nh,
				       void *data_end,
				       struct iphdr **iphdr)
{
	struct iphdr *iph = nh->pos;
	int hdrsize;

	if (iph + 1 > data_end)
		return -1;

	hdrsize = iph->ihl * 4;
	/* Sanity check packet field is valid */
	if(hdrsize < sizeof(*iph))
		return -1;

	/* Variable-length IPv4 header, need to use byte-based arithmetic */
	if (nh->pos + hdrsize > data_end)
		return -1;

	nh->pos += hdrsize;
	*iphdr = iph;

	return iph->saddr;
}

#define DM_MAXLEN 2561

/*
 * Solution to the assignment 1 in lesson packet02
 */
SEC("xdp_patch_ports")
int xdp_patch_ports_func(struct xdp_md *ctx)
{
	int action = XDP_PASS;
	int eth_type;
	__u32 saddrv4;
	struct ethhdr *eth;
	struct iphdr *iphdr;
	struct ipv6hdr *ipv6hdr;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh = { .pos = data };

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type < 0) {
		action = XDP_ABORTED;
		goto out;
	}

	if (eth_type == bpf_htons(ETH_P_IP)) {
		saddrv4 = parse_iphdr_saddr(&nh, data_end, &iphdr);

		struct ipv4_lpm_key key = {.prefixlen = 128, .data = {0}};
		*(__u32*)key.data = saddrv4;

        long* res = NULL; 
        res = bpf_map_lookup_elem(&dns_block_suffixes, &key);
        if(res){
            action = XDP_DROP;
            goto out;
        }

	} else if (eth_type == bpf_htons(ETH_P_IPV6)) {
		saddrv4 = parse_ip6hdr(&nh, data_end, &ipv6hdr);
	} else {
		goto out;
	}

out:
	return action;
}

char _license[] SEC("license") = "GPL";
