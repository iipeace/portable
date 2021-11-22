#https://processors.wiki.ti.com/index.php/Lmbench 

sudo chrt -r 1 taskset 0x1 ./lat_mem_rd -N 1 -P 1 256 512 2> mem_rd.out
sudo chrt -r 1 taskset 0x1 ./lat_ops 2> ops.out
sudo chrt -r 1 taskset 0x1 ./lat_ctx -s 128K processes 2 2> ctx.out
sudo chrt -r 1 taskset 0x1 ./lat_mmap 1M lat_mmap 2> mmap.out
sudo chrt -r 1 taskset 0x1 ./bw_mem 1M rd 2> memrd.out
sudo chrt -r 1 taskset 0x1 ./bw_mem 1M wr 2> memwr.out  
sudo chrt -r 1 taskset 0x1 ./par_ops 2> parops.out
sudo chrt -r 1 taskset 0x1 ./par_mem 2> parmem.out
