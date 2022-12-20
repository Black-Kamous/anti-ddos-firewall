/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"
#define bpf_printk(fmt, ...)				\
({                                                      \
        char ____fmt[] = fmt;                           \
        bpf_trace_printk(____fmt, sizeof(____fmt),      \
                         ##__VA_ARGS__);                \
})

#define DM_MAXLEN 64
#define SUF_MAXLEN 64

// static char *suf = "\03www\05baidu\03com";
// const int suf_end = 13;

struct qname_lpm_key {
	__u32 prefixlen;
	char rev_suf[SUF_MAXLEN];
};

struct {
        __uint(type, BPF_MAP_TYPE_LPM_TRIE);
        __type(key, struct qname_lpm_key);
        __type(value, __u32);
        __uint(map_flags, BPF_F_NO_PREALLOC);
        __uint(max_entries, 255);
} dns_block_suffixes SEC(".maps");

static __always_inline struct qname_lpm_key get_qname_lpm_key(const char* base, void* data_end){
	struct qname_lpm_key qlk = {
		.prefixlen = SUF_MAXLEN,
		.rev_suf = {0}
	};
	int qend = 0;
	char tmp = 0;
	while(qend<DM_MAXLEN){
		if(base+qend+1 > data_end){
			qlk.prefixlen = 0;
			return qlk;
		}
		tmp = base[qend];
		if(tmp == 0x00) break;
		qend += tmp+1;
	}
	qend--;
	int qlen = qend-1;
	int ind = 0, 
		nd = ind+base[ind]+1;
	while(ind<=qend && ind < DM_MAXLEN){
		ind++;
		while(ind<nd && ind < DM_MAXLEN){
			int i = 0;
			if(base+ind+1 > data_end){
				qlk.prefixlen = 0;
				return qlk;
			}
			qlk.rev_suf[i] = base[ind];
			ind++;
		}
		int j = 0; //qlen-ind;
		qlk.rev_suf[j] = '.';
		if(base+ind+1 > data_end){
			qlk.prefixlen = 0;
			return qlk;
		}
		nd = ind+base[ind]+1;
	}
	bpf_printk("rev suffix:%s\n", qlk.rev_suf);
	bpf_printk("q len:%d\n", qlen);
	return qlk;
}

// static __always_inline int is_suffix(const char* base, void* data_end){
// 	int base_end;
// 	#pragma unroll
// 	for(base_end=0;base_end<DM_MAXLEN;++base_end){
// 		if(base+base_end+1 > data_end){
// 			return -1;
// 		}
// 		if(base[base_end] == 0x00){
// 			base_end--;break;
// 		}
// 	}

// 	if(base_end < suf_end)
// 		return 0;
	
// 	int diff = base_end - suf_end;
// 	int i=suf_end;
// 	if(base+i+diff+1 > data_end)
// 		return -1;
// 	for(;i>=0;--i){
// 		if(suf[i] != base[i+diff])
// 			return 0;
// 	}

// 	return 1;
// }

/*
 * Solution to the assignment 1 in lesson packet02
 */
SEC("xdp_patch_ports")
int xdp_patch_ports_func(struct xdp_md *ctx)
{
	int action = XDP_PASS;
	int eth_type, ip_type;
	struct ethhdr *eth;
	struct iphdr *iphdr;
	struct ipv6hdr *ipv6hdr;
	struct udphdr *udphdr;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh = { .pos = data };

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type < 0) {
		action = XDP_ABORTED;
		goto out;
	}

	if (eth_type == bpf_htons(ETH_P_IP)) {
		ip_type = parse_iphdr(&nh, data_end, &iphdr);
	} else if (eth_type == bpf_htons(ETH_P_IPV6)) {
		ip_type = parse_ip6hdr(&nh, data_end, &ipv6hdr);
	} else {
		goto out;
	}

	if (ip_type == IPPROTO_UDP) {
		__u32 udppld = parse_udphdr(&nh, data_end, &udphdr);
		if (udppld < 0) {
			action = XDP_ABORTED;
			goto out;
		}
		if((__u8*)(nh.pos) + 12 > data_end){
			action = XDP_PASS;
			goto out;
		}
		__u16 qrn = *(((__u16*)(nh.pos))+2);
		if(qrn > 0){
			get_qname_lpm_key((char*)nh.pos+12, data_end);
		}
	} else {
		goto out;
	}

out:
	return action;
}

char _license[] SEC("license") = "GPL";
