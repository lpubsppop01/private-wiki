# Hyper-V on Windows 10
```
いつも通り VirtualBox  を入れようと思ったが、Hyper-V も Linux を公式サポートしているということで。
まずは [Windows の機能の有効化または無効化]-[Hyper-V] をオン。
再起動が促されるので再起動。

毎度忘れるネットワーク周り。
[Hyper-V マネージャー]-[仮想スイッチマネージャー] で外部仮想スイッチを追加。
[管理オペレーティングシステムにこのネットワークアダプターの共有を許可する] はオンにする。
これで物理 NIC は仮想スイッチに紐づき、新たにホスト用の仮想 NIC が追加される。
http://ebi.dyndns.biz/windowsadmin/2013/04/18/hyper-v%E3%81%AE%E3%83%8D%E3%83%83%E3%83%88%E3%83%AF%E3%83%BC%E3%82%AF%E3%82%92%E7%90%86%E8%A7%A3%E3%81%99%E3%82%8B-%E5%A4%96%E9%83%A8%E3%83%8D%E3%83%83%E3%83%88%E3%83%AF%E3%83%BC%E3%82%AF/

Linux の場合の注意点は、仮想マシンの世代を１にすること。そこだけ。

---------------------------------------------------------------

メモリ 4GB で Hyper-V はきつかったようで、落ちたり動作が不安定になったり。
ネットワーク周りが壊れてホストもネットワーク接続できなくなったので復元で機能追加前に戻した。
やっぱメモリ追加しないとだめか…。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-18T22:40:35+09:00