# Automatically Compresses: bit, KB, MB, GB
#
# Example:
#
# awk -v deger=BYTE -f byte.awk
#
# 10 Megabyte Test = 10485760 Byte
#
# awk -v deger=10485760 -f byte.awk
# 10.00 MB
#

function hesap(num,i)
{
        if (num>=1024)
        hesap(num/1024,i+1);
        else
        printf "%.2f %s\n", num,a[i+1];
}

BEGIN{
        split("b KB MB GB TB PB EB ZB YB",a);
        hesap(deger,0)
}
