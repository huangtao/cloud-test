.class public Lcom/boyaa/videodemo/utils/AppRTCAudioManager;
.super Ljava/lang/Object;
.source "AppRTCAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$boyaa$videodemo$utils$AppRTCAudioManager$AudioDevice:[I = null

.field private static final SPEAKERPHONE_AUTO:Ljava/lang/String; = "auto"

.field private static final SPEAKERPHONE_FALSE:Ljava/lang/String; = "false"

.field private static final SPEAKERPHONE_TRUE:Ljava/lang/String; = "true"

.field private static final TAG:Ljava/lang/String; = "AppRTCAudioManager"


# instance fields
.field private final apprtcContext:Landroid/content/Context;

.field private final audioDevices:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;",
            ">;"
        }
    .end annotation
.end field

.field private audioManager:Landroid/media/AudioManager;

.field private final defaultAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

.field private initialized:Z

.field private final onStateChangeListener:Ljava/lang/Runnable;

.field private proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

.field private savedAudioMode:I

.field private savedIsMicrophoneMute:Z

.field private savedIsSpeakerPhoneOn:Z

.field private selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

.field private final useSpeakerphone:Ljava/lang/String;

.field private wiredHeadsetReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static synthetic $SWITCH_TABLE$com$boyaa$videodemo$utils$AppRTCAudioManager$AudioDevice()[I
    .locals 3

    .prologue
    .line 32
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->$SWITCH_TABLE$com$boyaa$videodemo$utils$AppRTCAudioManager$AudioDevice:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->values()[Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->$SWITCH_TABLE$com$boyaa$videodemo$utils$AppRTCAudioManager$AudioDevice:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceStateChangeListener"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-boolean v2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->initialized:Z

    .line 53
    const/4 v1, -0x2

    iput v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedAudioMode:I

    .line 54
    iput-boolean v2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsSpeakerPhoneOn:Z

    .line 55
    iput-boolean v2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsMicrophoneMute:Z

    .line 66
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    .line 73
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    .line 111
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->apprtcContext:Landroid/content/Context;

    .line 112
    iput-object p2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onStateChangeListener:Ljava/lang/Runnable;

    .line 114
    const-string v1, "audio"

    .line 113
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 116
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 117
    .local v0, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v1, "Open speakerphone"

    .line 118
    const-string v2, "Default speak phone"

    .line 117
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->useSpeakerphone:Ljava/lang/String;

    .line 120
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->useSpeakerphone:Ljava/lang/String;

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->defaultAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .line 129
    :goto_0
    new-instance v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$1;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$1;-><init>(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V

    invoke-static {p1, v1}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->create(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    .line 137
    const-string v1, "AppRTCAudioManager"

    invoke-static {v1}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->logDeviceInfo(Ljava/lang/String;)V

    .line 138
    return-void

    .line 123
    :cond_0
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->defaultAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onProximitySensorChangedState()V

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;Z)V
    .locals 0

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->updateAudioDeviceState(Z)V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    return-object v0
.end method

.method public static create(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "deviceStateChangeListener"    # Ljava/lang/Runnable;

    .prologue
    .line 106
    new-instance v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-object v0
.end method

.method private hasEarpiece()Z
    .locals 2

    .prologue
    .line 308
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->apprtcContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 309
    const-string v1, "android.hardware.telephony"

    .line 308
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasWiredHeadset()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 321
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    return v0
.end method

.method private onAudioManagerChangedState()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 351
    const-string v1, "AppRTCAudioManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onAudioManagerChangedState: devices="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 352
    const-string v3, ", selected="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 351
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 358
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v2, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 359
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v2, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 358
    :goto_0
    invoke-static {v0}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->assertIsTrue(Z)V

    .line 361
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->start()Z

    .line 369
    :goto_1
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onStateChangeListener:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 372
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onStateChangeListener:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 374
    :cond_0
    return-void

    .line 359
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 362
    :cond_2
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-ne v1, v0, :cond_3

    .line 364
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->stop()V

    goto :goto_1

    .line 366
    :cond_3
    const-string v0, "AppRTCAudioManager"

    const-string v1, "Invalid device list"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private onProximitySensorChangedState()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->useSpeakerphone:Ljava/lang/String;

    const-string v1, "auto"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 88
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    .line 90
    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .line 89
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->sensorReportsNearState()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 94
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setAudioDevice(Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;)V

    goto :goto_0

    .line 98
    :cond_2
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setAudioDevice(Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;)V

    goto :goto_0
.end method

.method private registerForWiredHeadsetIntentBroadcast()V
    .locals 3

    .prologue
    .line 240
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 243
    .local v0, "filter":Landroid/content/IntentFilter;
    new-instance v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;-><init>(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->wiredHeadsetReceiver:Landroid/content/BroadcastReceiver;

    .line 279
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->apprtcContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->wiredHeadsetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 280
    return-void
.end method

.method private setMicrophoneMute(Z)V
    .locals 2
    .param p1, "on"    # Z

    .prologue
    .line 299
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    move-result v0

    .line 300
    .local v0, "wasMuted":Z
    if-ne v0, p1, :cond_0

    .line 304
    :goto_0
    return-void

    .line 303
    :cond_0
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setMicrophoneMute(Z)V

    goto :goto_0
.end method

.method private setSpeakerphoneOn(Z)V
    .locals 2
    .param p1, "on"    # Z

    .prologue
    .line 290
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    .line 291
    .local v0, "wasOn":Z
    if-ne v0, p1, :cond_0

    .line 295
    :goto_0
    return-void

    .line 294
    :cond_0
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_0
.end method

.method private unregisterForWiredHeadsetIntentBroadcast()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->apprtcContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->wiredHeadsetReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 285
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->wiredHeadsetReceiver:Landroid/content/BroadcastReceiver;

    .line 286
    return-void
.end method

.method private updateAudioDeviceState(Z)V
    .locals 3
    .param p1, "hasWiredHeadset"    # Z

    .prologue
    .line 327
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 328
    if-eqz p1, :cond_1

    .line 330
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 339
    :cond_0
    :goto_0
    const-string v0, "AppRTCAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "audioDevices: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    if-eqz p1, :cond_2

    .line 343
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setAudioDevice(Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;)V

    .line 347
    :goto_1
    return-void

    .line 334
    :cond_1
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 335
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->hasEarpiece()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 345
    :cond_2
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->defaultAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setAudioDevice(Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;)V

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 177
    const-string v0, "AppRTCAudioManager"

    const-string v1, "close"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->initialized:Z

    if-nez v0, :cond_0

    .line 197
    :goto_0
    return-void

    .line 182
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->unregisterForWiredHeadsetIntentBroadcast()V

    .line 183
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    const/4 v1, 0x3

    .line 184
    const/4 v2, 0x2

    .line 183
    invoke-virtual {v0, v3, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 186
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsSpeakerPhoneOn:Z

    invoke-direct {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setSpeakerphoneOn(Z)V

    .line 187
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsMicrophoneMute:Z

    invoke-direct {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setMicrophoneMute(Z)V

    .line 188
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    iget v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedAudioMode:I

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 189
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 191
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->stop()V

    .line 193
    iput-object v3, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->proximitySensor:Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    .line 196
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->initialized:Z

    goto :goto_0
.end method

.method public getAudioDevices()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedAudioDevice()Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    return-object v0
.end method

.method public init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 141
    const-string v0, "AppRTCAudioManager"

    const-string v1, "init"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->initialized:Z

    if-eqz v0, :cond_0

    .line 174
    :goto_0
    return-void

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedAudioMode:I

    .line 148
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsSpeakerPhoneOn:Z

    .line 149
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->savedIsMicrophoneMute:Z

    .line 152
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    .line 153
    const/4 v2, 0x2

    .line 152
    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 159
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioManager:Landroid/media/AudioManager;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 162
    invoke-direct {p0, v3}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setMicrophoneMute(Z)V

    .line 167
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->hasWiredHeadset()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->updateAudioDeviceState(Z)V

    .line 171
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->registerForWiredHeadsetIntentBroadcast()V

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->initialized:Z

    goto :goto_0
.end method

.method public setAudioDevice(Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;)V
    .locals 4
    .param p1, "device"    # Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .prologue
    const/4 v3, 0x0

    .line 201
    const-string v0, "AppRTCAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setAudioDevice(device="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->audioDevices:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->assertIsTrue(Z)V

    .line 204
    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->$SWITCH_TABLE$com$boyaa$videodemo$utils$AppRTCAudioManager$AudioDevice()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 218
    const-string v0, "AppRTCAudioManager"

    const-string v1, "Invalid audio device selection"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :goto_0
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onAudioManagerChangedState()V

    .line 222
    return-void

    .line 206
    :pswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setSpeakerphoneOn(Z)V

    .line 207
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    goto :goto_0

    .line 210
    :pswitch_1
    invoke-direct {p0, v3}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setSpeakerphoneOn(Z)V

    .line 211
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    goto :goto_0

    .line 214
    :pswitch_2
    invoke-direct {p0, v3}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->setSpeakerphoneOn(Z)V

    .line 215
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    goto :goto_0

    .line 204
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
