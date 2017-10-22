# JUMAN++ 1.02 Windowsビルド
日本語形態素解析システムJUMAN++ 1.02のWindowsビルド環境です。
Windows 64bitのみ対応しています。

JUMAN++についてはこちらをご参照ください。：
[日本語形態素解析システム JUMAN++](http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN++)

## 公式リリースとの違い
公式リリース(Linux版)との仕様上の違いは以下です。

リソースの探索：
- 実行ファイルと同じディレクトリにある「jumanpprc」（ピリオドなし）を読み込む。
- jumanpprcに書かれているパスが相対パスの場合、jumanpprcのあるディレクトリを起点とする。
- jumanpprcがない場合は、実行ファイルと同じディレクトリにある「dics」ディレクトリ内にリソース（辞書・モデルのファイル）があるとみなす。

jumanpprcにはリソースがあるディレクトリへのパスだけを書きます。
（`-D <path to directory>` オプションにてリソースのディレクトリを指定できますので、jumanpprcは必須ではありません。）

オプションの追加：
- `--i-file <path to file>` : 入力するファイルへのパス
- `--o-file <path to file>` : 出力するファイルへのパス
- `--encoding <encoding>` : エンコーディング指定

これらは通常モードのみ有効です。トレーニングモードでは無効になります。

`--encoding` オプションは、コンマ区切りで「<入力エンコーディング>,<出力エンコーディング>」のように指定します。  
コンマなしで一つだけ指定した場合は、入出力ともそのエンコーディングになります。

## 使用例
Shift_JISのファイルを入力し、結果をUTF-8でファイルに出力：  
```shell
path\to\jumanpp.exe --encoding sjis,utf-8 --i-file sjis.txt --o-file result.txt
```

CP932のコマンドプロンプトでインタラクティブに分析：  
```shell
path\to\jumanpp.exe -s 5 --encoding CP932
```

## 注意事項
全てのオプションでテストはしていません。
また64bitデータ対応しきれていない可能性もありますので、解析結果にオリジナルとの差異があるかもしれません。

## バイナリのダンロードとインストール
[リリースのページ](https://github.com/yujakudo/jumanppy/releases)より`jumanpp-1.02_ext-<version>_win64.zip`をダウンロードし、適当なディレクトリに解凍します。

解凍したディレクトリ内のdicsディレクトリにある「`make_rs.bat`」を、エクスプローラーでダブルクリックするなど	して実行してください。
辞書ファイルとマップファイルが作成されます。

展開後のディレクトリのサイズは2.1GBほどになります。

## ビルド
MSYS2のMinGW 64bit上でビルドの実績があります。

尚、32bit用には、ビルドできたとしても正常動作しません。

### ビルド要件
ビルドには以下のパッケージが必要です。（カッコ内は実績のあるバージョン）
- libgcc, libstdc++ (6.3.0-1)
- libwinpthread (5.0.0.4761.02bea78-1)
- libintl (0.19.7-3)
- libiconv (1.14-6)

mingw-w64-x86_64-toolchain に含まれるツール、patch, tar, unzip, perlなども必要です。

libgcc, libstdc++はtoolchainに含まれますし、libwinpthreadはデフォルトで入っているかもしれません。

また6GB程度のディスク容量が必要です。

### ビルド方法
MinGWのコンソールにて展開ディレクトリに移動後、以下を順に入力します。  
```shell
cd cexe
./btc download
./btc load
./btc build-w64
```

展開ディレクトリ下 `cexe/dist` に、ディレクトリ `jumanpp-1.02_ext_win64` が作成されます。
名前を変え、適切な場所に配置してください。

リリース版と同様、`dics/make_rs.bat` を実行してください。

## ライセンス
- cexe/archives以下のソース：
	- JUMAN++ (jumanpp-1.02.tar.xz) : Apache 2.0 (一部、3-Clause BSD)
	- Boost C++ library 1.65 (boost-1_65_subset.zip) : Boost 1.0
	- パッチで新たに追加されるファイルはパブリック・ドメインです。

- リリースしているWindows用バイナリには、上の他に以下のライブラリをリンクしています。：
	- libgcc, libstdc++ : GPLv3+
	- libwinpthread : MIT, 3-Clause BSD
	- libiconv : LGPL

以上。