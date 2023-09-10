#!/bin/bash 

## 设置当前的工作路径
CMD=$PWD
echo $CMD

## 修改模板文件
RATHOLE=rathole-server.service
cp rathole.service.template $RATHOLE
SED='s|\[PATH\]|'$CMD'|g'
echo $SED
sed -i $SED $RATHOLE
echo "生成的 rathole.service 文件如下："
cat $RATHOLE

## 需要管理员权限
## 将 service 文件复制到 /etc/systemd/system 文件路径下
mv -v $RATHOLE /etc/systemd/system


## 启动对应的服务
echo "systemctl 启动服务"
systemctl enable $RATHOLE 
systemctl start $RATHOLE


## 检查启动状态
systemctl status $RATHOLE

