#!/vendor/bin/sh

config="$1"

function doAddRadioFile(){
    if [[ -d /mnt/vendor/opporeserve/radio ]]; then
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_operator_switch.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        fi
        if [[ ! -f /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config ]]; then
            touch /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config
        fi

        chown radio system /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        chown radio system /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config

        chmod 0660 /mnt/vendor/opporeserve/radio/exp_operator_switch.config
        chmod 0660 /mnt/vendor/opporeserve/radio/exp_sim_operator_switch.config

    fi
    if [[ -d /mnt/vendor/oplusreserve/radio ]]; then
        if [[ ! -f /mnt/vendor/oplusreserve/radio/exp_operator_switch.config ]]; then
            touch /mnt/vendor/oplusreserve/radio/exp_operator_switch.config
        fi
        if [[ ! -f /mnt/vendor/oplusreserve/radio/exp_sim_operator_switch.config ]]; then
            touch /mnt/vendor/oplusreserve/radio/exp_sim_operator_switch.config
        fi

        chown radio system /mnt/vendor/oplusreserve/radio/exp_operator_switch.config
        chown radio system /mnt/vendor/oplusreserve/radio/exp_sim_operator_switch.config

        chmod 0660 /mnt/vendor/oplusreserve/radio/exp_operator_switch.config
        chmod 0660 /mnt/vendor/oplusreserve/radio/exp_sim_operator_switch.config

    fi
    if [[ -d /mnt/vendor/oplusreserve/radio ]]; then
        if [[ ! -f /mnt/vendor/oplusreserve/radio/rule_list.config ]]; then
            touch /mnt/vendor/oplusreserve/radio/rule_list.config
        fi

        chown radio system /mnt/vendor/oplusreserve/radio/rule_list.config

        chmod 0660 /mnt/vendor/oplusreserve/radio/rule_list.config

    fi
}

function doStartDiagSocketLog {
    ip_address=`getprop vendor.oplus.diag.socket.ip`
    port=`getprop vendor.oplus.diag.socket.port`
    retry=`getprop vendor.oplus.diag.socket.retry`
    channel=`getprop vendor.oplus.diag.socket.channel`
    if [[ -z "${ip_address}" ]]; then
        ip_address=0
    fi
    if [[ -z "${port}" ]]; then
        port=2500
    fi
    if [[ -z "${retry}" ]]; then
        port=10000
    fi
    if [[ -z "${channel}" ]]; then
        diag_socket_log -a ${ip_address} -p ${port} -r ${retry}
    else
        diag_socket_log -a ${ip_address} -p ${port} -r ${retry} -c ${channel}
    fi
}

function doStopDiagSocketLog {
    diag_socket_log -k
}

case "$config" in
    "addRadioFile")
    doAddRadioFile
    ;;
    "startDiagSocketLog")
    doStartDiagSocketLog
    ;;
    "stopDiagSocketLog")
    doStopDiagSocketLog
    ;;
esac
