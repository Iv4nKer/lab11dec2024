#!/bin/bash
mesto="$1"
porog="$2"
diskpart() {
        usage=$(df -h "$mesto" | awk 'NR==2 {print $5}' | sed 's/%//')
        if [[ -z "$usage" ]];
                then
                echo "ඞඞඞඞඞඞඞඞඞඞ Ne nashli disk ඞඞඞඞඞඞඞඞඞඞ"
                exit 1
        else echo "Zabito $usage% v meste: $mesto"
        fi
}
check_warn() {
        if (( usage > porog ));
        then
                echo "OPASNO, PREVISHEN POROG V $porog%!"
        else
                echo "Vse normul, porog v $porog% ne privishen, no progoni etot stariy hdd victoriey"
                echo " 𐐘 🤝 ඞ  "
        fi
}
diskpart "$mesto" "$porog"
check_warn "$mesto" "$porog"
