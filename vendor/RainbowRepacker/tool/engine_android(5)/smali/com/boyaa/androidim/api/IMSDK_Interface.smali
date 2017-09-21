.class public Lcom/boyaa/androidim/api/IMSDK_Interface;
.super Ljava/lang/Object;
.source "IMSDK_Interface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;,
        Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;,
        Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;
    }
.end annotation


# static fields
.field public static mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

.field private static syncKey:[B


# instance fields
.field public dLatitude:D

.field public dLontitude:D

.field public locationValue:Ljava/lang/String;

.field public mActivity:Landroid/app/Activity;

.field private mAudioFilePath:Ljava/lang/String;

.field private mAudioFileSize:I

.field private mAudioTimeLong:I

.field private mBoyaaLocationListener:Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;

.field public mCity:Ljava/lang/String;

.field public mHandler:Landroid/os/Handler;

.field mListener:Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;

.field private mLocationClient:Lcom/baidu/location/LocationClient;

.field mPlayListener:Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;

.field public mProvince:Ljava/lang/String;

.field private mUserPreferences:Landroid/content/SharedPreferences;

.field public mVibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->syncKey:[B

    .line 41
    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/os/Handler;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-string v1, ""

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    .line 50
    const-string v1, ""

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mCity:Ljava/lang/String;

    .line 51
    const-string v1, ""

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mProvince:Ljava/lang/String;

    .line 53
    new-instance v1, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;

    invoke-direct {v1, p0}, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;-><init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mListener:Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;

    .line 54
    new-instance v1, Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;

    invoke-direct {v1, p0}, Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;-><init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mPlayListener:Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;

    .line 56
    iput v3, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioTimeLong:I

    .line 57
    const-string v1, ""

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFilePath:Ljava/lang/String;

    .line 58
    iput v3, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFileSize:I

    .line 197
    iput-wide v4, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLatitude:D

    .line 198
    iput-wide v4, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLontitude:D

    .line 65
    iput-object p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    .line 66
    iput-object p2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mHandler:Landroid/os/Handler;

    .line 67
    sput-object p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    .line 71
    :try_start_0
    new-instance v1, Lcom/baidu/location/LocationClient;

    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/baidu/location/LocationClient;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    .line 72
    new-instance v1, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;

    invoke-direct {v1, p0}, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;-><init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mBoyaaLocationListener:Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;

    .line 73
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mBoyaaLocationListener:Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;

    invoke-virtual {v1, v2}, Lcom/baidu/location/LocationClient;->registerLocationListener(Lcom/baidu/location/BDLocationListener;)V

    .line 75
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mVibrator:Landroid/os/Vibrator;

    .line 77
    invoke-direct {p0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->initLocation()V

    .line 79
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    invoke-virtual {v1}, Lcom/baidu/location/LocationClient;->start()V

    .line 80
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    invoke-virtual {v1}, Lcom/baidu/location/LocationClient;->requestLocation()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :goto_0
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    const-string v2, "user"

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mUserPreferences:Landroid/content/SharedPreferences;

    .line 89
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Err"

    const-string v2, "bad permission"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/androidim/api/IMSDK_Interface;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFilePath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/androidim/api/IMSDK_Interface;I)V
    .locals 0

    .prologue
    .line 56
    iput p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioTimeLong:I

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/androidim/api/IMSDK_Interface;I)V
    .locals 0

    .prologue
    .line 58
    iput p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFileSize:I

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/androidim/api/IMSDK_Interface;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFilePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/boyaa/androidim/api/IMSDK_Interface;)I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioTimeLong:I

    return v0
.end method

.method static synthetic access$5(Lcom/boyaa/androidim/api/IMSDK_Interface;)I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFileSize:I

    return v0
.end method

.method public static getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    return-object v0
.end method

.method public static getInstance(Landroid/app/Activity;Landroid/os/Handler;)Lcom/boyaa/androidim/api/IMSDK_Interface;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 92
    sget-object v1, Lcom/boyaa/androidim/api/IMSDK_Interface;->syncKey:[B

    monitor-enter v1

    .line 93
    :try_start_0
    sget-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    if-eqz v0, :cond_0

    .line 94
    sget-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-virtual {v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->Destory()V

    .line 96
    :cond_0
    new-instance v0, Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/androidim/api/IMSDK_Interface;-><init>(Landroid/app/Activity;Landroid/os/Handler;)V

    sput-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    .line 92
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    sget-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    return-object v0

    .line 92
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private initLocation()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 184
    new-instance v0, Lcom/baidu/location/LocationClientOption;

    invoke-direct {v0}, Lcom/baidu/location/LocationClientOption;-><init>()V

    .line 185
    .local v0, "option":Lcom/baidu/location/LocationClientOption;
    sget-object v1, Lcom/baidu/location/LocationClientOption$LocationMode;->Hight_Accuracy:Lcom/baidu/location/LocationClientOption$LocationMode;

    invoke-virtual {v0, v1}, Lcom/baidu/location/LocationClientOption;->setLocationMode(Lcom/baidu/location/LocationClientOption$LocationMode;)V

    .line 186
    const-string v1, "gcj02"

    invoke-virtual {v0, v1}, Lcom/baidu/location/LocationClientOption;->setCoorType(Ljava/lang/String;)V

    .line 188
    const v1, 0x1d4c0

    invoke-virtual {v0, v1}, Lcom/baidu/location/LocationClientOption;->setScanSpan(I)V

    .line 189
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/baidu/location/LocationClientOption;->setIsNeedAddress(Z)V

    .line 190
    invoke-virtual {v0, v2}, Lcom/baidu/location/LocationClientOption;->setOpenGps(Z)V

    .line 191
    invoke-virtual {v0, v2}, Lcom/baidu/location/LocationClientOption;->setLocationNotify(Z)V

    .line 192
    invoke-virtual {v0, v2}, Lcom/baidu/location/LocationClientOption;->setIgnoreKillProcess(Z)V

    .line 194
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    invoke-virtual {v1, v0}, Lcom/baidu/location/LocationClient;->setLocOption(Lcom/baidu/location/LocationClientOption;)V

    .line 195
    return-void
.end method


# virtual methods
.method public Destory()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 129
    iput-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    .line 130
    sput-object v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mInstance:Lcom/boyaa/androidim/api/IMSDK_Interface;

    .line 132
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mLocationClient:Lcom/baidu/location/LocationClient;

    invoke-virtual {v0}, Lcom/baidu/location/LocationClient;->stop()V

    .line 133
    return-void
.end method

.method public getContractsInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/boyaa/androidim/contracts/GetContractsInfo;->getNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x3

    .line 137
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_1

    .line 139
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    .line 147
    :cond_0
    :goto_0
    return-object v0

    .line 143
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getUserLocation()Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "tmpLocal":Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, v2, :cond_0

    .line 147
    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method public getSIMContractsInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/boyaa/androidim/contracts/GetSIMContracts;->getNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserLocation()Ljava/lang/String;
    .locals 4

    .prologue
    .line 211
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mUserPreferences:Landroid/content/SharedPreferences;

    const-string v2, "LOCATION"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "strLocation":Ljava/lang/String;
    return-object v0
.end method

.method public goGPSSetting()V
    .locals 3

    .prologue
    .line 107
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 108
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 112
    :try_start_0
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    :goto_0
    return-void

    .line 114
    :catch_0
    move-exception v0

    .line 117
    .local v0, "ex":Landroid/content/ActivityNotFoundException;
    const-string v2, "android.settings.SETTINGS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    :try_start_1
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 120
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public saveUserLocation(Ljava/lang/String;)V
    .locals 4
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 205
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mUserPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 206
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "LOCATION"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 207
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 208
    return-void
.end method

.method public startAudioPlay(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-static {}, Lcom/boyaa/androidim/voice/VoiceManager;->getInstance()Lcom/boyaa/androidim/voice/VoiceManager;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mPlayListener:Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;

    invoke-virtual {v0, p1, v1}, Lcom/boyaa/androidim/voice/VoiceManager;->playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    .line 165
    return-void
.end method

.method public startAudioRecord()V
    .locals 3

    .prologue
    .line 174
    invoke-static {}, Lcom/boyaa/androidim/voice/VoiceManager;->getInstance()Lcom/boyaa/androidim/voice/VoiceManager;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mListener:Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/androidim/voice/VoiceManager;->startRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;I)V

    .line 175
    return-void
.end method

.method public stopAudioPlay()V
    .locals 1

    .prologue
    .line 169
    invoke-static {}, Lcom/boyaa/androidim/voice/VoiceManager;->getInstance()Lcom/boyaa/androidim/voice/VoiceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/androidim/voice/VoiceManager;->stopAudio()V

    .line 170
    return-void
.end method

.method public stopAudioRecord()V
    .locals 2

    .prologue
    .line 179
    invoke-static {}, Lcom/boyaa/androidim/voice/VoiceManager;->getInstance()Lcom/boyaa/androidim/voice/VoiceManager;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mListener:Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;

    invoke-virtual {v0, v1}, Lcom/boyaa/androidim/voice/VoiceManager;->stopRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V

    .line 180
    return-void
.end method
