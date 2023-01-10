#ifndef DNS
#define DNS

#include <stdio.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <stdint.h>
#include <sys/types.h>

struct dnshdr
{
    uint16_t id;
    uint16_t flags;
    uint16_t QRn;
    uint16_t AnRn;
    uint16_t ArRn;
    uint16_t AdRn;
};

typedef struct qname{
  int len;
  char* start;
}qname_t;

struct dnsqr
{
    qname_t qn;
    
    uint16_t type;
    uint16_t dclass;
    struct dnsqr* next;
};

typedef struct dnsqr * dnsqr_list;

int get_qr(u_char *start_pos, struct dnsqr *qr){
    u_char *ptr = start_pos;
    uint16_t ttlen = 0;
    int dcnt;
    while(*ptr){
        if(*ptr > 63)
        return -1;
        ttlen += (*ptr) + 1;
        ptr += (*ptr) + 1;
    }
    qr->type = ntohs(*(uint16_t *)(++ptr));
    ptr += 2;
    qr->dclass = ntohs(*(uint16_t *)ptr);

    qr->qn.len = ttlen;
    qr->qn.start = (char *)malloc(ttlen);
    ptr = start_pos;

    char* writer = qr->qn.start;

    while(*ptr){
        dcnt = *ptr;
        while(dcnt--){
            *(writer++) = *(++ptr);
        }
        *(writer++) = '.';
        ++ptr;
    }

    *(writer-1) = '\0';
    return ttlen+4;
}

dnsqr_list get_qr_list(struct dnshdr *dns){
    dnsqr_list begin = NULL;
    dnsqr_list end = NULL;
    int qrn = ntohs(dns->QRn);
    u_char *qstart = (u_char *)(dns+1);
    
    int qrlen = 0;
    dnsqr_list qr;
    while(qrn--){
        qr = (dnsqr_list)malloc(sizeof(struct dnsqr));
        qr->next = NULL;
        qrlen = get_qr(qstart, qr);
        if(qrlen < 0){
            return NULL;
        }

        if(!end){
            end = qr;
            begin = qr;
        }else{
            end->next = qr;
        }

        qstart += qrlen;
    }
    return begin;
}

void free_qr_list(dnsqr_list ls){
    dnsqr_list nx;
    while(ls){
        nx = ls->next;
        free(ls->qn.start);
        free(ls);
        ls = nx;
    }
}

#endif