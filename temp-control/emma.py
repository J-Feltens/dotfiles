import os
import json

emma_raw = os.popen('sensors -j').read()

emma = json.loads(emma_raw)

cpu_key = 'k10temp-pci-00c3'
fan_key = 'nct6798-isa-0290'

print(emma['nct6798-isa-0290'].keys())

cpu_temps = {
        'package': emma[cpu_key]['Tctl']['temp1_input'],
        'core0': emma[cpu_key]['Tccd1']['temp3_input'],
        'core1': emma[cpu_key]['Tccd2']['temp4_input'],
}

cpu_fans = {
        'noctua0': emma[fan_key]['fan2']['fan2_input'],
        'noctua1': emma[fan_key]['fan7']['fan7_input'],
}




print(cpu_temps)
print(cpu_fans)
