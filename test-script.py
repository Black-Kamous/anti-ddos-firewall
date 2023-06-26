import os
import time

testdata = ["../data426/test10M.pcap"]

pack_cap = "./pack_cap "
addf = "./addf"


for f in testdata:
    os.system(pack_cap + '-A ' + '-f ' + f)
    time.sleep(5)
    os.system(pack_cap + '-Q ' + '-f ' + f)
    time.sleep(5)

    f = os.popen(addf)
    ls = f.readlines()
    tstr = time.strftime('%d-%H:%M:%S', time.localtime())
    with open("../testreports/test-"+tstr+".rep", 'w') as wf:
        for l in ls:
            wf.write(l)
    time.sleep(5)
