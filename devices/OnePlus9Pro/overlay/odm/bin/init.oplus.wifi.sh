#! /vendor/bin/sh

target="$1"
serialno="$2"

btsoc=""

#ifdef OPLUS_FEATURE_WIFI_BDF
#WuGuotian@CONNECTIVITY.WIFI.HARDWARE.BDF.1065227 , 2021/05/26, copy bdf
#Add for make bin Rom-update.

testvalue=`getprop persist.vendor.oplus.engineer.test`
if [ "${testvalue}" = "0" ]; then
    bdf_name="bdwlan0.elf"
elif [ "${testvalue}" = "1" ]; then
    bdf_name="bdwlan1.elf"
else
    bdf_name="bdwlan.elf"
fi

if [ ! -s /mnt/vendor/persist/bdwlan.elf ] ; then
    cp /odm/etc/wifi/$bdf_name /mnt/vendor/persist/bdwlan.elf
    sync
fi

persistbdf=`md5sum /mnt/vendor/persist/bdwlan.elf |cut -d" " -f1`
vendorbdf=`md5sum /odm/etc/wifi/$bdf_name |cut -d" " -f1`
if [ x"$vendorbdf" != x"$persistbdf" ]; then
    cp /odm/etc/wifi/$bdf_name /mnt/vendor/persist/bdwlan.elf
    sync
	echo "bdf check"
fi

chmod 666 /mnt/vendor/persist/bdwlan.elf
chown system:wifi /mnt/vendor/persist/bdwlan.elf

#endif /* OPLUS_FEATURE_WIFI_BDF */

if [ ! -s /mnt/vendor/persist/wlan/cnss_diag.conf ] ; then
    cp /odm/etc/wifi/cnss_diag.conf /mnt/vendor/persist/wlan/cnss_diag.conf
    chmod 666 /mnt/vendor/persist/wlan/cnss_diag.conf
    sync
fi


#ifdef OPLUS_FEATURE_WIFI_BDF
#WuGuotian@CONNECTIVITY.WIFI.HARDWARE.BDF.1065227, 2021/05/26, copy regbd

if [ ! -s /mnt/vendor/persist/regdb.bin ] || [ ! -s /mnt/vendor/persist/regdbw.bin ]; then
    cp /odm/etc/wifi/regdb.bin /mnt/vendor/persist/regdb.bin
	    cp /odm/etc/wifi/regdbw.bin /mnt/vendor/persist/regdbw.bin
    sync
fi

if [ ! -s /mnt/vendor/persist/hardware_debug ] ; then
    vendorRegdb=`md5sum /mnt/vendor/persist/regdb.bin |cut -d" " -f1`
    persistRegdb=`md5sum /odm/etc/wifi/regdb.bin |cut -d" " -f1`
    vendorRegdbw=`md5sum /mnt/vendor/persist/regdbw.bin |cut -d" " -f1`
    persistRegdbw=`md5sum /odm/etc/wifi/regdbw.bin |cut -d" " -f1`
    if [ x"$vendorRegdb" != x"$persistRegdb" ] || [ x"$vendorRegdbw" != x"$persistRegdbw" ]; then
        cp /odm/etc/wifi/regdb.bin /mnt/vendor/persist/regdb.bin
        cp /odm/etc/wifi/regdbw.bin /mnt/vendor/persist/regdbw.bin
        sync
        echo "regdb check"
    fi
fi

chmod 666 /mnt/vendor/persist/regdb.bin
chown system:wifi /mnt/vendor/persist/regdb.bin
chown system:wifi /mnt/vendor/persist/regdb.bin
chmod 666 /mnt/vendor/persist/regdbw.bin
chown system:wifi /mnt/vendor/persist/regdbw.bin

#endif /* OPLUS_FEATURE_WIFI_BDF */

#LiJunlong@CONNECTIVITY.WIFI.NETWORK.1065227,2020/08/07
reg_info=`getprop ro.vendor.oplus.euex.country`
testvalue=`getprop persist.vendor.oplus.engineer.test`
if [ "${testvalue}" = "3" ] || [ "${testvalue}" = "0" ] || [ "${testvalue}" = "1" ]; then
    sourceFile=/odm/vendor/etc/wifi/WCNSS_qcom_cfg_roam.ini
    echo "export disable roam file dir config"
elif [ "w${reg_info}" = "wUA" ]; then
    echo "export UA file dir config"
else
    sourceFile=/odm/vendor/etc/wifi/WCNSS_qcom_cfg.ini
fi
targetFile=/mnt/vendor/persist/wlan/WCNSS_qcom_cfg.ini
#Yuan.Huang@PSW.CN.Wifi.Network.internet.1065227, 2016/11/09,
#Add for make WCNSS_qcom_cfg.ini Rom-update.
if [ -s "$sourceFile" ]; then
	system_version=`head -1 "$sourceFile" | grep OplusVersion | cut -d= -f2`
	if [ "${system_version}x" = "x" ]; then
		system_version=1
	fi
else
	system_version=1
fi

#LiJunlong@CONNECTIVITY.WIFI.NETWORK,1065227,2020/07/29,Add for rus ini
if [ -s /mnt/vendor/persist/wlan/qca_cld/WCNSS_qcom_cfg.ini ]; then
    cp  /mnt/vendor/persist/wlan/qca_cld/WCNSS_qcom_cfg.ini \
        $targetFile
    sync
    chown system:wifi $targetFile
    chmod 666 $targetFile
    rm -rf /mnt/vendor/persist/wlan/qca_cld
fi

if [ -s "$targetFile" ]; then
	persist_version=`head -1 "$targetFile" | grep OplusVersion | cut -d= -f2`
	if [ "${persist_version}x" = "x" ]; then
		persist_version=0
	fi
else
	persist_version=0
fi


if [ ! -s "$targetFile" -o $system_version -gt $persist_version ]; then
    cp $sourceFile  $targetFile
    sync
    chown system:wifi $targetFile
    chmod 666 $targetFile
fi

persistini=`cat "$targetFile" | grep -v "#" | grep -wc "END"`
if [ x"$persistini" = x"0" ]; then
    cp $sourceFile  $targetFile
    sync
    chown system:wifi $targetFile
    chmod 666 $targetFile
    echo "ini check"
fi

#endif /* OPLUS_FEATURE_WIFI_POWER */

#Add for make WCNSS_qcom_cfg.ini update.
if [ "${testvalue}" = "0" ] || [ "${testvalue}" = "1" ] || [ "${testvalue}" = "2" ] || [ "${testvalue}" = "3" ]; then
    cp $sourceFile  $targetFile
    sync
    chown system:wifi $targetFile
    chmod 666 $targetFile
fi
