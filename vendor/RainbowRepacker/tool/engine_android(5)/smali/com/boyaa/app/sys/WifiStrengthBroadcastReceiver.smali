.class public Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WifiStrengthBroadcastReceiver.java"


# static fields
.field public static strength:I


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->strength:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static getStrength()I
    .locals 1

    .prologue
    .line 46
    sget v0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->strength:I

    return v0
.end method

.method private getWifiInfo()V
    .locals 10

    .prologue
    .line 20
    iget-object v7, p0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->mContext:Landroid/content/Context;

    const-string v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 21
    .local v6, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v5

    .line 22
    .local v5, "wifiInfo":Landroid/net/wifi/WifiInfo;
    if-nez v5, :cond_1

    .line 41
    :cond_0
    :goto_0
    return-void

    .line 25
    :cond_1
    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 28
    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    .line 29
    .local v3, "ssid":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v0

    .line 30
    .local v0, "rssi":I
    sput v0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->strength:I

    .line 33
    const/4 v7, 0x4

    invoke-static {v0, v7}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v1

    .line 35
    .local v1, "signalLevel":I
    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result v2

    .line 37
    .local v2, "speed":I
    const-string v4, "Mbps"

    .line 39
    .local v4, "units":Ljava/lang/String;
    const-string v7, "WifiChangeBroadcastReceiver"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "ssid="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",rssi="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",signalLevel="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",speed="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ",units="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->mContext:Landroid/content/Context;

    .line 15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Wifi\u53d1\u751f\u53d8\u5316"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;->getWifiInfo()V

    .line 17
    return-void
.end method
