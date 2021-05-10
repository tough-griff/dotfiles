function ipv4 -d "Lookup public IPv4 address"
    dig -4 @ns1.google.com TXT o-o.myaddr.l.google.com +short | string replace -a "\"" ""
end
