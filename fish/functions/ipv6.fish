function ipv6 -d "Lookup public IPv6 address"
    dig -6 @ns1.google.com TXT o-o.myaddr.l.google.com +short | string replace -a "\"" ""
end
