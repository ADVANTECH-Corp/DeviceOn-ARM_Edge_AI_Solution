#!/bin/bash


rm -f ~/EI_ABC.fifo
mkfifo ~/EI_ABC.fifo
chmod 666 ~/EI_ABC.fifo
exec 4<> ~/EI_ABC.fifo

wait

cp /home/modelfile_0456.eim ~/my_model.eim
edge-impulse-linux-runner --api-key <API Key>  --model-file ~/my_model.eim 2>&1 | tee >&4
