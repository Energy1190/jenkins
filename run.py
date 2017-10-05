import os
import sys
import time
import socket
import subprocess

error = open('/error.log', 'w')
out = open('/out.log', 'w')

sys.stdout = out
sys.stderr = error

sock = socket.socket(socket.AF_UNIX)
sock.bind('/tmp/python.sock')
sock.listen(5)

def run(cmd):
    return subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def data_check(data_list):
    if not any(data_list): return False
    x = ''.join(map(str, data_list))
    if x.split(sep='|')[0] != 'secret python password': return False
    return run(x.split(sep='|')[1])

def check_answer(data):
    if data: data = str(data)
    if data == 'ANSWER': return True
    else: return False

answer = []
while True:
    conn,addr = sock.accept()
    data_list = []
    while True:
        data = conn.recv(1024)
        if check_answer(data):
            conn.send(bytes(''.join(answer)))
            break
        data_list.append(data)
        if not data: break
    x = data_check(data_list)
    if x: answer.append(x)
    time.sleep(5)
