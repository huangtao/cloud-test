.class public Lcom/boyaa/enginedlqp/maindevelop/GameActivity;
.super Lcom/boyaa/engine/made/AppActivity;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;,
        Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;,
        Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;
    }
.end annotation


# static fields
.field private static final BACKGROUND_MAX_MS:I = 0x493e0

.field public static final HANDLER_BACKGROUND_REMAIN:I = 0x3

.field public static final HANDLER_HTTPGET_UPDATE_TIMEOUT:I = 0x5

.field public static final HANDLER_HTTPPOST_TIMEOUT:I = 0x4

.field public static final HANDLER_OPENGL_NOT_SUPPORT:I = 0x2

.field private static final HANDLER_SHOW_DIALOG:I = 0x0

.field public static final kFalse:I = 0x0

.field public static final kNone:I = -0x1

.field public static final kTrue:I = 0x1

.field public static mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

.field private static mHandler:Landroid/os/Handler;

.field private static mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;


# instance fields
.field private mAudioPath:Ljava/lang/String;

.field public mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

.field public mHeight:I

.field private mImagePath:Ljava/lang/String;

.field mUUID:Ljava/lang/String;

.field public mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 62
    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 65
    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    .line 66
    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    .line 73
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppActivity;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    .line 52
    iput v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mWidth:I

    .line 53
    iput v1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHeight:I

    .line 54
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mUUID:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public static call_lua(Ljava/lang/String;)I
    .locals 1
    .param p0, "strFunctionName"    # Ljava/lang/String;

    .prologue
    .line 343
    invoke-static {p0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static end()V
    .locals 0

    .prologue
    .line 436
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->end()V

    .line 437
    return-void
.end method

.method public static getBackgroundMusicVolume()F
    .locals 1

    .prologue
    .line 384
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->getMusicVolume()F

    move-result v0

    return v0
.end method

.method public static getEffectsVolume()F
    .locals 1

    .prologue
    .line 408
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->getEffectVolume()F

    move-result v0

    return v0
.end method

.method public static getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 319
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static isBackgroundMusicPlaying()Z
    .locals 1

    .prologue
    .line 380
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->isMusicPlaying()Z

    move-result v0

    return v0
.end method

.method public static pauseAllEffects()V
    .locals 0

    .prologue
    .line 428
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->pauseAllEffects()V

    .line 429
    return-void
.end method

.method public static pauseBackgroundMusic()V
    .locals 0

    .prologue
    .line 368
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->pauseMusic()V

    .line 369
    return-void
.end method

.method public static pauseEffect(I)V
    .locals 0
    .param p0, "soundId"    # I

    .prologue
    .line 400
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->pauseEffect(I)V

    .line 401
    return-void
.end method

.method public static playBackgroundMusic(Ljava/lang/String;Z)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "isLoop"    # Z

    .prologue
    .line 360
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/AppSound;->playMusic(Ljava/lang/String;Z)V

    .line 361
    return-void
.end method

.method public static playEffect(Ljava/lang/String;Z)I
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "isLoop"    # Z

    .prologue
    .line 392
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/AppSound;->playEffect(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public static preloadBackgroundMusic(Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 356
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->preloadMusic(Ljava/lang/String;)V

    .line 357
    return-void
.end method

.method public static preloadEffect(Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 416
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->preloadEffect(Ljava/lang/String;)V

    .line 417
    return-void
.end method

.method public static resumeAllEffects()V
    .locals 0

    .prologue
    .line 432
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->resumeAllEffects()V

    .line 433
    return-void
.end method

.method public static resumeBackgroundMusic()V
    .locals 0

    .prologue
    .line 372
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->resumeMusic()V

    .line 373
    return-void
.end method

.method public static resumeEffect(I)V
    .locals 0
    .param p0, "soundId"    # I

    .prologue
    .line 404
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->resumeEffect(I)V

    .line 405
    return-void
.end method

.method public static rewindBackgroundMusic()V
    .locals 0

    .prologue
    .line 376
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->rewindMusic()V

    .line 377
    return-void
.end method

.method public static setBackgroundMusicVolume(F)V
    .locals 0
    .param p0, "volume"    # F

    .prologue
    .line 388
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->setMusicVolume(F)V

    .line 389
    return-void
.end method

.method public static setEffectsVolume(F)V
    .locals 0
    .param p0, "volume"    # F

    .prologue
    .line 412
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->setEffectVolume(F)V

    .line 413
    return-void
.end method

.method private setGodSDKInfoForLua()V
    .locals 0

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->setSupportPmodesForLua()V

    .line 228
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->setSupportLoginTagForLua()V

    .line 229
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->setOtherInfos()V

    .line 230
    return-void
.end method

.method private setOtherInfos()V
    .locals 5

    .prologue
    .line 259
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->isQuitRequired()Z

    move-result v1

    .line 260
    .local v1, "quit":Z
    const-string v3, "boyaa_godsdk"

    const-string v4, "quit"

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-static {v3, v4, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 263
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getChannelSymbol(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 264
    .local v0, "channelSymbol":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 265
    const-string v2, "boyaa_godsdk"

    const-string v3, "channel_symbol"

    invoke-static {v2, v3, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    :cond_0
    return-void

    .line 260
    .end local v0    # "channelSymbol":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private setSupportLoginTagForLua()V
    .locals 6

    .prologue
    .line 246
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getSupportLoginTagsForLua()Ljava/util/Set;

    move-result-object v2

    .line 247
    .local v2, "loginTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    .line 248
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 249
    .local v1, "ja":Lorg/json/JSONArray;
    const-string v3, "boyaa_godsdk"

    const-string v4, "login_tags"

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    .end local v1    # "ja":Lorg/json/JSONArray;
    :cond_0
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getDefaultLoginTagsForLua()Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, "defaultLoginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 254
    const-string v3, "boyaa_godsdk"

    const-string v4, "default_login_tag"

    invoke-static {v3, v4, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    :cond_1
    return-void
.end method

.method private setSupportPmodesForLua()V
    .locals 5

    .prologue
    .line 233
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getSupportingPmodesForLua()Ljava/util/Set;

    move-result-object v1

    .line 234
    .local v1, "pmodes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v1, :cond_1

    .line 235
    const-string v2, "431"

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->isWXAppSupportPayment()Z

    move-result v2

    if-nez v2, :cond_0

    .line 237
    const-string v2, "431"

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 240
    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 241
    .local v0, "ja":Lorg/json/JSONArray;
    const-string v2, "boyaa_godsdk"

    const-string v3, "pmodes"

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    .end local v0    # "ja":Lorg/json/JSONArray;
    :cond_1
    return-void
.end method

.method public static showMessageBox(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 347
    const-string v1, "FATAL"

    invoke-virtual {p0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 348
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 349
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->what:I

    .line 350
    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 351
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 353
    .end local v0    # "msg":Landroid/os/Message;
    :cond_0
    return-void
.end method

.method public static stopAllEffects()V
    .locals 0

    .prologue
    .line 424
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->stopAllEffect()V

    .line 425
    return-void
.end method

.method public static stopBackgroundMusic()V
    .locals 1

    .prologue
    .line 364
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/boyaa/engine/made/AppSound;->stopMusic(Z)V

    .line 365
    return-void
.end method

.method public static stopEffect(I)V
    .locals 0
    .param p0, "soundId"    # I

    .prologue
    .line 396
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->stopEffect(I)V

    .line 397
    return-void
.end method

.method public static terminateProcess()V
    .locals 1

    .prologue
    .line 440
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    if-eqz v0, :cond_0

    .line 441
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onBeforeKillProcess()V

    .line 442
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->finish()V

    .line 444
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->end()V

    .line 446
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 447
    return-void
.end method

.method public static unloadEffect(Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 420
    invoke-static {p0}, Lcom/boyaa/engine/made/AppSound;->unloadEffect(Ljava/lang/String;)V

    .line 421
    return-void
.end method


# virtual methods
.method public CreateApp(Landroid/os/Bundle;)Z
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 90
    sput-object p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 91
    const-string v2, "keyguard"

    invoke-virtual {p0, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 92
    .local v0, "mKeyguardManager":Landroid/app/KeyguardManager;
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 93
    const/4 v2, 0x0

    .line 105
    :goto_0
    return v2

    .line 96
    :cond_0
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 97
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 98
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mWidth:I

    .line 99
    iget v2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHeight:I

    .line 102
    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;

    invoke-direct {v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$AppHandler;-><init>()V

    sput-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    .line 104
    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    invoke-direct {v2, p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    .line 105
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public OnBeforeLuaLoad()V
    .locals 2

    .prologue
    .line 273
    invoke-super {p0}, Lcom/boyaa/engine/made/AppActivity;->OnBeforeLuaLoad()V

    .line 274
    invoke-static {}, Lcom/boyaa/engine/common/UploadDumpFile;->getInstance()Lcom/boyaa/engine/common/UploadDumpFile;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, p0, v1}, Lcom/boyaa/engine/common/UploadDumpFile;->execute(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;)V

    .line 275
    const-string v0, "storage_user_images"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    .line 276
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    .line 280
    :cond_0
    const-string v0, "storage_user_audio"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    .line 281
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 282
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    .line 284
    :cond_1
    return-void
.end method

.method public OnSetEnv()V
    .locals 41

    .prologue
    .line 110
    invoke-super/range {p0 .. p0}, Lcom/boyaa/engine/made/AppActivity;->OnSetEnv()V

    .line 111
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v33

    .line 112
    .local v33, "strPackageName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 113
    .local v8, "appInfo":Landroid/content/pm/ApplicationInfo;
    const/16 v23, 0x0

    .line 114
    .local v23, "packInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    .line 116
    .local v24, "packMgmr":Landroid/content/pm/PackageManager;
    const/16 v38, 0x0

    :try_start_0
    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    .line 117
    const/16 v38, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    move/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v23

    .line 121
    :goto_0
    move-object/from16 v0, v23

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v36, v0

    .line 122
    .local v36, "versionCode":I
    move-object/from16 v0, v23

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v37, v0

    .line 123
    .local v37, "versionName":Ljava/lang/String;
    iget-object v6, v8, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 124
    .local v6, "apkFilePath":Ljava/lang/String;
    new-instance v38, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v39

    move-object/from16 v0, v39

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    move-object/from16 v39, v0

    invoke-static/range {v39 .. v39}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v39, "/lib"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 125
    .local v16, "libraryPath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v31

    .line 126
    .local v31, "strFilePath":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v34

    .line 127
    .local v34, "strSDPath":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v32

    .line 128
    .local v32, "strLang":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v30

    .line 132
    .local v30, "strCountry":Ljava/lang/String;
    :try_start_1
    const-string v38, "apkChanged"

    const/16 v39, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v38

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v29

    .line 133
    .local v29, "sp":Landroid/content/SharedPreferences;
    const-string v38, "apkSize"

    const-wide/16 v39, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v38

    move-wide/from16 v2, v39

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v20

    .line 134
    .local v20, "oldApkLength":J
    const-string v38, "apkVersionCode"

    const/16 v39, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v38

    move/from16 v2, v39

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v22

    .line 136
    .local v22, "oldApkVersionCode":I
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Landroid/app/Application;->getPackageResourcePath()Ljava/lang/String;

    move-result-object v7

    .line 137
    .local v7, "apkPath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    .local v5, "apkFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v18

    .line 140
    .local v18, "newApkLength":J
    const/16 v27, 0x0

    .line 143
    .local v27, "replaceInstallValue":I
    cmp-long v38, v20, v18

    if-eqz v38, :cond_0

    .line 144
    invoke-interface/range {v29 .. v29}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    .line 145
    .local v17, "mEditor":Landroid/content/SharedPreferences$Editor;
    const-string v38, "apkSize"

    move-object/from16 v0, v17

    move-object/from16 v1, v38

    move-wide/from16 v2, v18

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 146
    const-string v38, "apkVersionCode"

    move-object/from16 v0, v17

    move-object/from16 v1, v38

    move/from16 v2, v36

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 147
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 149
    move/from16 v0, v22

    move/from16 v1, v36

    if-ge v0, v1, :cond_2

    .line 151
    const/16 v27, 0x1

    .line 161
    .end local v17    # "mEditor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    :goto_1
    const-string v38, "android_app_info"

    const-string v39, "replaceInstall"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move/from16 v2, v27

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 163
    const-string v38, "AppActivity.OnSetEnv"

    new-instance v39, Ljava/lang/StringBuilder;

    const-string v40, "oldApkLength\uff1a"

    invoke-direct/range {v39 .. v40}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v39

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, ",newApkLength\uff1a"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, v39

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v38 .. v39}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const-string v38, "AppActivity.OnSetEnv"

    new-instance v39, Ljava/lang/StringBuilder;

    const-string v40, "oldApkVersionCode\uff1a"

    invoke-direct/range {v39 .. v40}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v39

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v39

    const-string v40, ",newApkVersionCode\uff1a"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    move-object/from16 v0, v39

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v38 .. v39}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    const-string v38, "AppActivity.OnSetEnv"

    new-instance v39, Ljava/lang/StringBuilder;

    const-string v40, "replaceInstallValue\uff1a"

    invoke-direct/range {v39 .. v40}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v39

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v38 .. v39}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 172
    .end local v5    # "apkFile":Ljava/io/File;
    .end local v7    # "apkPath":Ljava/lang/String;
    .end local v18    # "newApkLength":J
    .end local v20    # "oldApkLength":J
    .end local v22    # "oldApkVersionCode":I
    .end local v27    # "replaceInstallValue":I
    .end local v29    # "sp":Landroid/content/SharedPreferences;
    :goto_2
    const-string v11, ""

    .line 173
    .local v11, "deviceId":Ljava/lang/String;
    const-string v15, ""

    .line 174
    .local v15, "imsi":Ljava/lang/String;
    const-string v14, ""

    .line 175
    .local v14, "imei":Ljava/lang/String;
    const-string v13, ""

    .line 176
    .local v13, "iccid":Ljava/lang/String;
    const-string v26, ""

    .line 177
    .local v26, "phoneNumber":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getApplication()Landroid/app/Application;

    move-result-object v38

    const-string v39, "phone"

    invoke-virtual/range {v38 .. v39}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Landroid/telephony/TelephonyManager;

    .line 178
    .local v35, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v35, :cond_1

    .line 179
    invoke-virtual/range {v35 .. v35}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v11

    .line 180
    invoke-virtual/range {v35 .. v35}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v26

    .line 181
    invoke-virtual/range {v35 .. v35}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v15

    .line 182
    invoke-virtual/range {v35 .. v35}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v14

    .line 183
    invoke-virtual/range {v35 .. v35}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v13

    .line 187
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getCacheDir()Ljava/io/File;

    move-result-object v10

    .line 188
    .local v10, "cacheDir":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    .line 190
    .local v9, "cache":Ljava/lang/String;
    new-instance v38, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v39, "/."

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v39

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 191
    .local v28, "rootPath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v38

    const-string v39, "android_id"

    invoke-static/range {v38 .. v39}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 192
    .local v4, "androidId":Ljava/lang/String;
    sget-object v25, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 193
    .local v25, "phoneModel":Ljava/lang/String;
    const-string v38, "android_app_info"

    const-string v39, "version_code"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 194
    const-string v38, "android_app_info"

    const-string v39, "version_name"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v37

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    const-string v38, "android_app_info"

    const-string v39, "packages"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const-string v38, "android_app_info"

    const-string v39, "apk_path"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v6}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const-string v38, "android_app_info"

    const-string v39, "lib_path"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    const-string v38, "android_app_info"

    const-string v39, "files_path"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v31

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    const-string v38, "android_app_info"

    const-string v39, "sd_path"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v34

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    const-string v38, "android_app_info"

    const-string v39, "lang"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v32

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    const-string v38, "android_app_info"

    const-string v39, "country"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    const-string v38, "android_app_info"

    const-string v39, "uuid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mUUID:Ljava/lang/String;

    move-object/from16 v40, v0

    invoke-static/range {v38 .. v40}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v38, "android_app_info"

    const-string v39, "device_id"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v11}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const-string v38, "android_app_info"

    const-string v39, "cache"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v9}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    const-string v38, "android_app_info"

    const-string v39, "rootPath"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    const-string v38, "android_app_info"

    const-string v39, "imsi"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v15}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    const-string v38, "android_app_info"

    const-string v39, "imei"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v14}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const-string v38, "android_app_info"

    const-string v39, "iccid"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v13}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    const-string v38, "android_app_info"

    const-string v39, "phoneNumber"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    const-string v38, "android_app_info"

    const-string v39, "androidId"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    invoke-static {v0, v1, v4}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    const-string v38, "android_app_info"

    const-string v39, "phoneModel"

    move-object/from16 v0, v38

    move-object/from16 v1, v39

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->clearAllExternalStorageWhenInstall()V

    .line 214
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->setGodSDKInfoForLua()V

    .line 216
    return-void

    .line 152
    .end local v4    # "androidId":Ljava/lang/String;
    .end local v9    # "cache":Ljava/lang/String;
    .end local v10    # "cacheDir":Ljava/io/File;
    .end local v11    # "deviceId":Ljava/lang/String;
    .end local v13    # "iccid":Ljava/lang/String;
    .end local v14    # "imei":Ljava/lang/String;
    .end local v15    # "imsi":Ljava/lang/String;
    .end local v25    # "phoneModel":Ljava/lang/String;
    .end local v26    # "phoneNumber":Ljava/lang/String;
    .end local v28    # "rootPath":Ljava/lang/String;
    .end local v35    # "telephonyManager":Landroid/telephony/TelephonyManager;
    .restart local v5    # "apkFile":Ljava/io/File;
    .restart local v7    # "apkPath":Ljava/lang/String;
    .restart local v17    # "mEditor":Landroid/content/SharedPreferences$Editor;
    .restart local v18    # "newApkLength":J
    .restart local v20    # "oldApkLength":J
    .restart local v22    # "oldApkVersionCode":I
    .restart local v27    # "replaceInstallValue":I
    .restart local v29    # "sp":Landroid/content/SharedPreferences;
    :cond_2
    move/from16 v0, v22

    move/from16 v1, v36

    if-ne v0, v1, :cond_3

    .line 154
    const/16 v27, 0x2

    .line 155
    goto/16 :goto_1

    :cond_3
    move/from16 v0, v22

    move/from16 v1, v36

    if-le v0, v1, :cond_0

    .line 157
    const/16 v27, 0x3

    goto/16 :goto_1

    .line 167
    .end local v5    # "apkFile":Ljava/io/File;
    .end local v7    # "apkPath":Ljava/lang/String;
    .end local v17    # "mEditor":Landroid/content/SharedPreferences$Editor;
    .end local v18    # "newApkLength":J
    .end local v20    # "oldApkLength":J
    .end local v22    # "oldApkVersionCode":I
    .end local v27    # "replaceInstallValue":I
    .end local v29    # "sp":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v12

    .line 168
    .local v12, "e":Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 118
    .end local v6    # "apkFilePath":Ljava/lang/String;
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v16    # "libraryPath":Ljava/lang/String;
    .end local v30    # "strCountry":Ljava/lang/String;
    .end local v31    # "strFilePath":Ljava/lang/String;
    .end local v32    # "strLang":Ljava/lang/String;
    .end local v34    # "strSDPath":Ljava/lang/String;
    .end local v36    # "versionCode":I
    .end local v37    # "versionName":Ljava/lang/String;
    :catch_1
    move-exception v38

    goto/16 :goto_0
.end method

.method public clearAllExternalStorageWhenInstall()V
    .locals 0

    .prologue
    .line 224
    invoke-super {p0}, Lcom/boyaa/engine/made/AppActivity;->clearAllExternalStorageWhenInstall()V

    .line 225
    return-void
.end method

.method public getAudioPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mAudioPath:Ljava/lang/String;

    return-object v0
.end method

.method public getImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mImagePath:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v1, 0x400

    .line 77
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->requestWindowFeature(I)Z

    .line 78
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 79
    invoke-super {p0, p1}, Lcom/boyaa/engine/made/AppActivity;->onCreate(Landroid/os/Bundle;)V

    .line 80
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getGLView()Lcom/boyaa/engine/made/AppGLSurfaceView;

    move-result-object v0

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$1;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 87
    return-void
.end method

.method protected onPause()V
    .locals 4

    .prologue
    .line 304
    invoke-super {p0}, Lcom/boyaa/engine/made/AppActivity;->onPause()V

    .line 305
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 306
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    const-wide/32 v2, 0x493e0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 309
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    if-eqz v0, :cond_1

    .line 310
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->onPause()V

    .line 313
    :cond_1
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_2

    .line 314
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onPause()V

    .line 316
    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 288
    invoke-super {p0}, Lcom/boyaa/engine/made/AppActivity;->onResume()V

    .line 289
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 290
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 293
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    if-eqz v0, :cond_1

    .line 294
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mNetworkType:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;->onResume()V

    .line 297
    :cond_1
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_2

    .line 298
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onResume()V

    .line 300
    :cond_2
    return-void
.end method

.method protected showDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 323
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Ok"

    new-instance v3, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$2;

    invoke-direct {v3, p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$2;-><init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 328
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 330
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 332
    return-void
.end method
