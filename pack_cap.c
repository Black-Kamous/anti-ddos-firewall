#define _GNU_SOURCE

#include <pcap.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/if_ether.h>
#include <netinet/ip.h>
#include <netinet/udp.h>
#include "dns.h"

FILE *qname_out, *ip_out, *ipttl_out, *all_out;

void save(const char *str, int len)
{
  fprintf(all_out, " %s", str);
}

void saveqname(const char *str, int len)
{
  printf("%s\n", str);
  fprintf(qname_out, "%s\n", str);
  fflush(qname_out);
}

void saveip(const char *str, int len)
{
  printf("%s\n", str);
  fprintf(ip_out, "%s\n", str);
  fflush(ip_out);
}

void saveipttl(const char *str, uint8_t ttl)
{
  printf("%s %u\n", str, ttl);
  fprintf(ipttl_out, "%s %u\n", str, ttl);
  fflush(ipttl_out);
}

void getAll(u_char *arg, const struct pcap_pkthdr *pkthdr, const u_char *packet)
{
  void *ptr = (void *)packet;

  // ETH Header
  uint16_t e_type;

  struct ethhdr *eth;
  eth = (struct ethhdr *)ptr;
  e_type = ntohs(eth->h_proto);

  ptr = (void *)((struct ethhdr *)ptr + 1);

  if (e_type != ETH_P_IP)
  {
    return;
  }

  // IP Header
  struct iphdr *ip;
  ip = (struct iphdr *)ptr;
  e_type = ntohs(ip->protocol);

  char paddr[16];
  inet_ntop(AF_INET, (void *)&ip->saddr, paddr, 16);
  fprintf(all_out, "%s %u", paddr, ip->ttl);

  ptr = ptr + ip->ihl * 4;


  // UDP Header
  struct udphdr *udp;
  udp = (struct udphdr *)ptr;

  ptr = (void *)((struct udphdr *)ptr + 1);

  // DNS
  struct dnshdr *dns;
  dns = (struct dnshdr *)ptr;
  dnsqr_list ql = get_qr_list(dns);
  dnsqr_list head = ql;
  if (!ql)
  {
    return;
  }

  while (ql)
  {
    save(ql->qn.start, ql->qn.len);
    ql = ql->next;
  }

  free_qr_list(head);
  fprintf(all_out, " %lu\n", pkthdr->ts.tv_sec);
  fflush(all_out);
}

void save_qr_raw(const u_char *packet, int packlen)
{
  void *ptr = (void *)packet;

  // ETH Header
  uint16_t e_type;

  struct ethhdr *eth;
  eth = (struct ethhdr *)ptr;
  e_type = ntohs(eth->h_proto);

  ptr = (void *)((struct ethhdr *)ptr + 1);

  if (e_type != ETH_P_IP)
  {
    return;
  }

  // IP Header
  struct iphdr *ip;
  ip = (struct iphdr *)ptr;
  e_type = ntohs(ip->protocol);

  ptr = ptr + ip->ihl * 4;

  // UDP Header
  struct udphdr *udp;
  udp = (struct udphdr *)ptr;

  ptr = (void *)((struct udphdr *)ptr + 1);

  // DNS
  struct dnshdr *dns;
  dns = (struct dnshdr *)ptr;
  dnsqr_list ql = get_qr_list(dns);
  dnsqr_list head = ql;
  if (!ql)
  {
    return;
  }

  while (ql)
  {
    saveqname(ql->qn.start, ql->qn.len);
    ql = ql->next;
  }

  free_qr_list(head);
}

void getQname(u_char *arg, const struct pcap_pkthdr *pkthdr, const u_char *packet)
{
  int *id = (int *)arg;

  printf("id: %d\n", ++(*id));
  printf("Packet length: %d\n", pkthdr->len);
  printf("Number of bytes: %d\n", pkthdr->caplen);
  printf("Recieved time: %s", ctime((const time_t *)&pkthdr->ts.tv_sec));

  int i;
  for (i = 0; i < pkthdr->len; ++i)
  {
    printf(" %02x", packet[i]);
    if ((i + 1) % 16 == 0)
    {
      printf("\n");
    }
  }

  printf("\n\n");

  save_qr_raw(packet, pkthdr->caplen);

  printf("\n\n");
}

void getIP(u_char *arg, const struct pcap_pkthdr *pkthdr, const u_char *packet)
{
  void *ptr = (void *)packet;

  // ETH Header
  uint16_t e_type;

  struct ethhdr *eth;
  eth = (struct ethhdr *)ptr;
  e_type = ntohs(eth->h_proto);

  ptr = (void *)((struct ethhdr *)ptr + 1);

  if (e_type != ETH_P_IP)
  {
    return;
  }

  // IP Header
  struct iphdr *ip;
  ip = (struct iphdr *)ptr;
  e_type = ntohs(ip->protocol);

  char paddr[16];
  inet_ntop(AF_INET, (void *)&ip->saddr, paddr, 16);
  saveip(paddr, 16);
}

void getIPTTL(u_char *arg, const struct pcap_pkthdr *pkthdr, const u_char *packet)
{
  void *ptr = (void *)packet;

  // ETH Header
  uint16_t e_type;

  struct ethhdr *eth;
  eth = (struct ethhdr *)ptr;
  e_type = ntohs(eth->h_proto);

  ptr = (void *)((struct ethhdr *)ptr + 1);

  if (e_type != ETH_P_IP)
  {
    return;
  }

  // IP Header
  struct iphdr *ip;
  ip = (struct iphdr *)ptr;
  e_type = ntohs(ip->protocol);

  char paddr[16];
  inet_ntop(AF_INET, (void *)&ip->saddr, paddr, 16);
  saveipttl(paddr, 16);
}

int main(int argc, char **argv)
{
  char errBuf[PCAP_ERRBUF_SIZE];
  pcap_if_t *it;
  int r;
  char filename[256] = "";

  void (*getter)(u_char *, const struct pcap_pkthdr *, const u_char *) = NULL;

  char opt;
  while ((opt = getopt(argc, argv, "AQHUf:")) != -1)
  {
    switch (opt)
    {
    case 'Q':
      qname_out = fopen("midds/qname.midd", "w");
      getter = getQname;
      break;
    case 'H':
      ipttl_out = fopen("midds/ipttl.midd", "w");
      getter = getIPTTL;
      break;
    case 'U':
      ip_out = fopen("midds/ip.midd", "w");
      getter = getIP;
      break;
    case 'A':
      all_out = fopen("midds/all.midd", "w");
      getter = getAll;
      break;
    case 'f':
      strncpy(filename, optarg, 256);
      break;
    }
  }

  /* get a device */
  r = pcap_findalldevs(&it, errBuf);

  if (r == -1)
  {
    return -1;
  }

  while (it)
  {
    if (!strcmp(it->name, "lo"))
    {
      break;
    }
    it = it->next;
  }

  if (!it)
    return 0;

  pcap_t *device = NULL;
  /* open a device, wait until a packet arrives */
  // pcap_t * device = pcap_open_offline("test.pcap",errBuf);     //读取本地文件作为网络包数据
  if(filename[0] == '\0'){
    device = pcap_open_live(it->name, 65535, 0, 5000, errBuf);

    if (!device)
    {
      printf("error: pcap_open_live(): %s\n", errBuf);
      exit(1);
    }

    printf("Capturing on dev %s\n", it->name);

    /* construct a filter */
    struct bpf_program filter;
    pcap_compile(device, &filter, "udp port 33340", 0, 0);
    pcap_setfilter(device, &filter);

    
  }else{
    device = pcap_open_offline(filename,errBuf);
    printf("reading from %s\n", filename);
  }

  /* wait loop forever */
  int id = 0;
  pcap_loop(device, -3, getter, (u_char *)&id);

  pcap_close(device);
  return 0;
}