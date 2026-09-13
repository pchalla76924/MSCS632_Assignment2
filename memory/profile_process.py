"""Small, dependency-free Linux profiler using /proc.
Usage: python3 profile_process.py <command> [args ...]
Reports elapsed time and sampled peak resident-set size (RSS).
"""
import subprocess, sys, time
if len(sys.argv) < 2:
    raise SystemExit("usage: profile_process.py command [args ...]")
start=time.perf_counter()
p=subprocess.Popen(sys.argv[1:], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
peak=0
while p.poll() is None:
    try:
        for line in open(f"/proc/{p.pid}/status"):
            if line.startswith("VmRSS:"):
                peak=max(peak,int(line.split()[1]))
                break
    except FileNotFoundError:
        pass
    time.sleep(0.002)
out,err=p.communicate()
elapsed=time.perf_counter()-start
print(out, end="")
if err: print(err, end="", file=sys.stderr)
print(f"PROFILE elapsed_seconds={elapsed:.6f} peak_rss_kb={peak}")
raise SystemExit(p.returncode)
