/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>

#include <linux/if_ether.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"

#define DM_MAXLEN 256

const char *suf = "\03www\05baidu\03com";
const int suf_end = 13;

int is_suffix(const char* base){
	int base_end;
	#pragma unroll
	for(base_end=0;base_end<DM_MAXLEN;++base_end){
		if(base[base_end] == 0x00){base_end--;break;}}

	if(base_end < suf_end)
		return 0;
	
	int diff = base_end - suf_end;
	int i=suf_end;
	#pragma unroll
	for(;i>=0;--i){
		if(suf[i] != base[i+diff])
			return 0;
	}

	return 1;
}

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
		if (parse_udphdr(&nh, data_end, &udphdr) < 0) {
			action = XDP_ABORTED;
			goto out;
		}
		
	} else {
		goto out;
	}

out:
	return action;
}

char _license[] SEC("license") = "GPL";
