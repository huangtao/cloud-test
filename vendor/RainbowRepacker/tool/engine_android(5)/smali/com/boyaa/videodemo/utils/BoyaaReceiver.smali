.class public Lcom/boyaa/videodemo/utils/BoyaaReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BoyaaReceiver.java"


# static fields
.field public static final BOOT_COMPLETED:Ljava/lang/String; = "android.intent.action.BOOT_COMPLETED"

.field private static lastType:I


# instance fields
.field private final TAG:Ljava/lang/String;

.field listener:Landroid/telephony/PhoneStateListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, -0x1

    sput v0, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->lastType:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 17
    const-string v0, "BoyaaReceiver"

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->TAG:Ljava/lang/String;

    .line 95
    new-instance v0, Lcom/boyaa/videodemo/utils/BoyaaReceiver$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/BoyaaReceiver$1;-><init>(Lcom/boyaa/videodemo/utils/BoyaaReceiver;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->listener:Landroid/telephony/PhoneStateListener;

    .line 14
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 21
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "action":Ljava/lang/String;
    const-string v5, "BoyaaReceiver"

    invoke-static {v5, v0}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    const-string v5, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 26
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    iget-object v5, v5, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    if-eqz v5, :cond_0

    .line 27
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    iget-object v5, v5, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v6, 0x58

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 29
    :cond_0
    const-string v5, "connectivity"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 30
    .local v1, "connManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 32
    .local v2, "info":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 38
    sget v5, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->lastType:I

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v6

    if-eq v5, v6, :cond_1

    .line 40
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 42
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    iget-object v5, v5, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    if-eqz v5, :cond_1

    .line 43
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v5

    iget-object v5, v5, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v6, 0x59

    const-wide/16 v7, 0x5dc

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 47
    :cond_1
    if-nez v2, :cond_2

    .line 48
    const/4 v5, -0x1

    sput v5, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->lastType:I

    .line 93
    .end local v1    # "connManager":Landroid/net/ConnectivityManager;
    .end local v2    # "info":Landroid/net/NetworkInfo;
    :goto_0
    return-void

    .line 50
    .restart local v1    # "connManager":Landroid/net/ConnectivityManager;
    .restart local v2    # "info":Landroid/net/NetworkInfo;
    :cond_2
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    sput v5, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->lastType:I

    goto :goto_0

    .line 65
    .end local v1    # "connManager":Landroid/net/ConnectivityManager;
    .end local v2    # "info":Landroid/net/NetworkInfo;
    :cond_3
    const-string v5, "android.intent.action.NEW_OUTGOING_CALL"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 67
    const-string v5, "android.intent.extra.PHONE_NUMBER"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 68
    .local v3, "phoneNumber":Ljava/lang/String;
    const-string v5, "BoyaaReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "call OUT:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const/4 v5, 0x0

    sput-boolean v5, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    goto :goto_0

    .line 89
    .end local v3    # "phoneNumber":Ljava/lang/String;
    :cond_4
    const-string v5, "phone"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 90
    .local v4, "tm":Landroid/telephony/TelephonyManager;
    iget-object v5, p0, Lcom/boyaa/videodemo/utils/BoyaaReceiver;->listener:Landroid/telephony/PhoneStateListener;

    const/16 v6, 0x20

    invoke-virtual {v4, v5, v6}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    goto :goto_0
.end method
