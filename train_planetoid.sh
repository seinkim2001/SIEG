cmd_time=`TZ=UTC-8 date "+%Y%m%d-%H%M%S"`

# Cora
nohup python3 train.py --device 0 --cmd_time ${cmd_time} --num_heads 8 --dataset Cora --use_feature --epochs 20 --model DGCNNGraphormer_noNeigFeat --runs 3 --batch_size 64 --lr 0.0001 --num_workers 4 --dynamic_train --dynamic_val --dynamic_test --use_len_spd --use_num_spd --use_cnb_jac >> train_log/cora_${cmd_time}.log 2>&1 &

# Citeseer
nohup python3 train.py --device 0 --cmd_time ${cmd_time} --num_heads 8 --dataset Citeseer --use_feature --epochs 20 --model DGCNNGraphormer_noNeigFeat --runs 3 --batch_size 64 --lr 0.0001 --num_workers 4 --dynamic_train --dynamic_val --dynamic_test --use_len_spd --use_num_spd --use_cnb_jac >> train_log/citeseer_${cmd_time}.log 2>&1 &

# Pubmed
nohup python3 train.py --device 0 --cmd_time ${cmd_time} --num_heads 8 --dataset Pubmed --use_feature --epochs 20 --model DGCNNGraphormer_noNeigFeat --runs 3 --batch_size 64 --lr 0.0001 --num_workers 4 --dynamic_train --dynamic_val --dynamic_test --use_len_spd --use_num_spd --use_cnb_jac >> train_log/pubmed_${cmd_time}.log 2>&1 &
