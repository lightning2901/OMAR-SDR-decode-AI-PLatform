#!/usr/bin/env python3
import whisper
import torch

###################
#seccion de generador de timestamp para cada archivo procesado
#la idea es que cada archivo tenga como nombre la fecha del archivo 
#Como fuer recibido del raspberry para que sea coherente con la realidad. 
##################

# Seccion de transcriptor
torch.xpu.is_available()
torch.xpu.init()
torch.xpu.set_device(0)
torch.xpu.is_initialized()
device = torch.device('xpu')
model = whisper.load_model("turbo")

#transcripcion = model.transcribe(file, fp16=True)
with open(out_file, "w", encoding = "utf8") as f:
    f.write(result["AQUISENECESITAPONERUNNOMBRE"])
print("archivo transcrito")
