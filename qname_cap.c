#define _GNU_SOURCE

#include <pcap.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <arpa/inet.h>
#include <netinet/if_ether.h>
#include <netinet/ip.h>
#include <netinet/udp.h>
#include "dns.h"

void save(const char * str, int len){
  printf("%s|%d\n", str, len);
}

void save_qr_raw(const u_char *packet, int packlen){
  void * ptr = (void *)packet;
  
  // ETH Header
  uint16_t e_type;

  struct ethhdr *eth;
  eth = (struct ethhdr *)ptr;
  e_type = ntohs(eth->h_proto);

  ptr = (void *)((struct ethhdr *)ptr + 1);

  if (e_type != ETH_P_IP) {
    return;
  }   

  // IP Header
  struct iphdr *ip;
  ip = (struct iphdr *)ptr;
  e_type = ntohs(ip->protocol);

  ptr =  ptr + ip->ihl*4;

  // UDP Header
  struct udphdr *udp;
  udp = (struct udphdr *)ptr;

  ptr = (void *)((struct udphdr *)ptr + 1);

  // DNS
  struct dnshdr *dns;
  dns = (struct dnshdr *)ptr;
  dnsqr_list ql = get_qr_list(dns);
  dnsqr_list head = ql;
  if(!ql){
    return;
  }

  while(ql){
    save(ql->qn.start, ql->qn.len);
    ql = ql->next;
  }

  free_qr_list(head);
}
 
void getPacket(u_char * arg, const struct pcap_pkthdr * pkthdr, const u_char * packet)
{
  int * id = (int *)arg;
 
  printf("id: %d\n", ++(*id));
  printf("Packet length: %d\n", pkthdr->len);
  printf("Number of bytes: %d\n", pkthdr->caplen);
  printf("Recieved time: %s", ctime((const time_t *)&pkthdr->ts.tv_sec));
 
  int i;
  for(i=0; i<pkthdr->len; ++i)
  {
    printf(" %02x", packet[i]);
    if( (i + 1) % 16 == 0 )
    {
      printf("\n");
    }
  }
 
  printf("\n\n");

  save_qr_raw(packet, pkthdr->caplen);

  printf("\n\n");
}
 
int main()
{
  char errBuf[PCAP_ERRBUF_SIZE];
  pcap_if_t *it;
  int r;

  /* get a device */
  r = pcap_findalldevs(&it, errBuf);

  if(r == -1){
    return -1;
  }

  while(it){
    if(!strcmp(it->name, "eth0")){
      break;
    }
    it = it->next;
  }

  if(!it)
    return 0;
 
  /* open a device, wait until a packet arrives */
  //pcap_t * device = pcap_open_offline("test.pcap",errBuf);     //读取本地文件作为网络包数据
  pcap_t * device = pcap_open_live(it->name, 65535, 1, 5000, errBuf);
 
  if(!device)
  {
    printf("error: pcap_open_live(): %s\n", errBuf);
    exit(1);
  }
  
  printf("Capturing on dev %s\n", it->name);

  /* construct a filter */
  struct bpf_program filter;
  pcap_compile(device, &filter, "udp port 33340", 0, 0);
  pcap_setfilter(device, &filter);
 
  /* wait loop forever */
  int id = 0;
  pcap_loop(device, -3, getPacket, (u_char*)&id);
 
  pcap_close(device);
 
  return 0;
}