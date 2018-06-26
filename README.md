# UbuntuデスクトップDockerイメージ

このプロジェクトは、日本人向けのUbuntuデスクトップ環境を、Dockerコンテナとして提供することを目的とします。  
Ubuntuデスクトップ環境を、クライアントVNC上で利用することが出来ます。

## デスクトップ環境の構成

- xvfbによる仮想ディスプレイ
- xfceによる軽量デスクトップ環境
- x11vncによるリモートデスクトップ

## 日本人向け対応

- 日本語言語パックのプレインストール
- 日本語入力(Anthy)のプレインストール
- 日本のタイムゾーン設定

## 使い方

```sh
docker build -t ubuntux .
docker run --name ubuntux -d -it -p 5900:5900 ubuntux
```
