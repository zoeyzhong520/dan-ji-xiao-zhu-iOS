


#   ⚠️⚠️⚠️⚠️
#【./tdinstall.sh  】

# 删除指定版本号+pod install
#   ⚠️⚠️⚠️⚠️

# ${SRCROOT} 为脚本文件所在的目录
    
# 工程根目录
SRCROOT=$(pwd)

if [ "$1" = "package" ];then
    NewDATE=$2
else
    NewDATE=`date +%s`
fi

temp_path="$SRCROOT/TempPath"

if [ ! -d "$temp_path" ] ; then
    mkdir -pv $temp_path
fi

#获取当前podfile 可以检测Podfile和podfile
#podfile=$(find .  -name "*odfile.lock")
#podfile="${podfile#./}"
#podfile="${podfile%.lock}"
#echo "识别:podfile=${podfile}"
#value=""
#
#sed -i "" "s/:commit:.*/:commit: $value/g" "${SRCROOT}/$podfile.lock"

#pod install

tdspec_path=(~/.cocoapods/repos/ZJSpec)
if [ ! -d "$tdspec_path" ] ; then
        pod repo add ZJSpec 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
fi

cd $SRCROOT

pod repo update 'ZJSpec'

pod update --verbose --no-repo-update | tee "$temp_path/$NewDATE.log"

if [ "$1" = "package" ];then
    exit 0
fi

# 判断是否安装成功
if cat $temp_path/$NewDATE.log | grep "Pod installation complete!" > /dev/null
then
    echo "pod install成功 🌹🌹🌹"
    rm -rf $temp_path
    exit 0
else
    echo "pod install失败 ⚠️⚠️⚠️"
    rm -rf $temp_path
    exit 1
fi








