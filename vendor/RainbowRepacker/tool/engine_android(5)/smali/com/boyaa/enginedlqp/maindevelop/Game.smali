.class public Lcom/boyaa/enginedlqp/maindevelop/Game;
.super Lcom/boyaa/enginedlqp/maindevelop/GameActivity;
.source "Game.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;
    }
.end annotation


# static fields
.field public static final CLOSE_START_DIALOG_TIME:I = 0x1d4c0

.field public static final DEBUG:Z = true

.field public static final HANDLER_CLOSE_START_DIALOG:I = 0x3

.field public static final HANDLER_OPENGL_NOT_SUPPORT:I = 0x4

.field public static final HANDLER_SHOW_START_DIALOG:I = 0x6

.field public static final TIMEOUT_MSG_ID_BEGIN:I = 0x3e8

.field public static final TIMEOUT_MSG_ID_END:I = 0x7d0

.field private static gameHandler:Landroid/os/Handler;

.field public static isLandscapeState:Z

.field public static isSetScreenOrientation:Z

.field public static mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

.field private static mCallAppParam:Ljava/lang/String;

.field public static mFeedback:Ljava/lang/Object;

.field public static mIsActivityCreated:Z

.field public static mSyncMsgIds:Ljava/lang/Object;

.field public static mTimeoutMsgIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static versionCode:I

.field public static versionName:Ljava/lang/String;

.field private static vib:Landroid/os/Vibrator;


# instance fields
.field private final DEAD:I

.field private final LIMIT_TIME:I

.field private mIsPaying:Z

.field private mIsSocketSleeping:Z

.field public mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

.field public mPopupWindow:Landroid/widget/PopupWindow;

.field private mSocketCounterHander:Landroid/os/Handler;

.field private mStartDialog:Lcom/boyaa/app/AppStartDialog;

.field public progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

.field simListener:Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;

.field telMgr:Landroid/telephony/TelephonyManager;

.field private uploadFeedImage:Lcom/boyaa/app/image/UploadFeedbackImage;

.field wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 85
    sput v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionCode:I

    .line 86
    const-string v0, ""

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionName:Ljava/lang/String;

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    .line 91
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSyncMsgIds:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mFeedback:Ljava/lang/Object;

    .line 95
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    .line 97
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->isLandscapeState:Z

    .line 98
    sput-boolean v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->isSetScreenOrientation:Z

    .line 103
    sput-boolean v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsActivityCreated:Z

    .line 112
    const-string v0, ""

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mCallAppParam:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;-><init>()V

    .line 87
    iput-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->uploadFeedImage:Lcom/boyaa/app/image/UploadFeedbackImage;

    .line 105
    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsPaying:Z

    .line 107
    iput-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    .line 1106
    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    .line 1119
    const/4 v0, 0x1

    iput v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->DEAD:I

    .line 1120
    const v0, 0x493e0

    iput v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->LIMIT_TIME:I

    .line 74
    return-void
.end method

.method public static ClearTimeout(I)V
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 275
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSyncMsgIds:Ljava/lang/Object;

    monitor-enter v1

    .line 276
    :try_start_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 277
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeMessages(I)V

    .line 275
    :cond_0
    monitor-exit v1

    .line 281
    return-void

    .line 275
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static SetTimeout(IJ)V
    .locals 4
    .param p0, "id"    # I
    .param p1, "ms"    # J

    .prologue
    .line 263
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7d0

    if-lt p0, v0, :cond_1

    .line 271
    :cond_0
    :goto_0
    return-void

    .line 266
    :cond_1
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSyncMsgIds:Ljava/lang/Object;

    monitor-enter v1

    .line 267
    :try_start_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 266
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method static synthetic access$0(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/AppStartDialog;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/enginedlqp/maindevelop/Game;Lcom/boyaa/app/AppStartDialog;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1177
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->socketSleepDead()V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/enginedlqp/maindevelop/Game;)Z
    .locals 1

    .prologue
    .line 1106
    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    return v0
.end method

.method static synthetic access$4(Lcom/boyaa/enginedlqp/maindevelop/Game;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 1117
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSocketCounterHander:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$5(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1169
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->socketWakeUp()V

    return-void
.end method

.method private callLua(Ljava/lang/String;)V
    .locals 2
    .param p1, "funStr"    # Ljava/lang/String;

    .prologue
    .line 1182
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/Game$22;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/Game$22;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 1192
    return-void
.end method

.method private changeScreenOrientation(Ljava/lang/String;)V
    .locals 3
    .param p1, "jsonstr"    # Ljava/lang/String;

    .prologue
    .line 852
    const-string v2, ""

    if-ne p1, v2, :cond_1

    .line 871
    :cond_0
    :goto_0
    return-void

    .line 857
    :cond_1
    :try_start_0
    sget-boolean v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->isSetScreenOrientation:Z

    if-nez v2, :cond_0

    .line 858
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 859
    .local v1, "object":Lorg/json/JSONObject;
    const-string v2, "isLandscapeState"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    sput-boolean v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->isLandscapeState:Z

    .line 860
    const/4 v2, 0x1

    sput-boolean v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->isSetScreenOrientation:Z

    .line 861
    sget-boolean v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->isLandscapeState:Z

    if-eqz v2, :cond_2

    .line 862
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->setRequestedOrientation(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 867
    .end local v1    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 869
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 864
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "object":Lorg/json/JSONObject;
    :cond_2
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p0, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game;->setRequestedOrientation(I)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private dismissBackgroundDialog()V
    .locals 1

    .prologue
    .line 1263
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    if-eqz v0, :cond_1

    .line 1264
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/common/LoadingSceneDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1265
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/common/LoadingSceneDialog;->dismiss()V

    .line 1267
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    .line 1269
    :cond_1
    return-void
.end method

.method private dismissLoadingDialog()V
    .locals 1

    .prologue
    .line 1300
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1301
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v0}, Lcom/boyaa/widget/LoadingDialog;->dismiss()V

    .line 1303
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    .line 1304
    return-void
.end method

.method public static getCallAppParam()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mCallAppParam:Ljava/lang/String;

    return-object v0
.end method

.method public static getGameHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 171
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->gameHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getIsLandscapeState()Z
    .locals 1

    .prologue
    .line 1338
    sget-boolean v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->isLandscapeState:Z

    return v0
.end method

.method public static getIsSetScreenOrientation()Z
    .locals 1

    .prologue
    .line 1342
    sget-boolean v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->isSetScreenOrientation:Z

    return v0
.end method

.method private loadScreenBrightness()V
    .locals 7

    .prologue
    .line 248
    const-string v3, "set"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 249
    .local v2, "preference":Landroid/content/SharedPreferences;
    const-string v3, "brightness"

    const v4, 0x3f4ccccd    # 0.8f

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    .line 251
    .local v0, "brightness":F
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    .line 252
    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 254
    .local v1, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    float-to-double v3, v0

    const-wide v5, 0x3fb999999999999aL    # 0.1

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    .line 255
    const v0, 0x3dcccccd    # 0.1f

    .line 256
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 258
    :cond_0
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 259
    return-void
.end method

.method private sendDelayMessage()V
    .locals 4

    .prologue
    .line 1258
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    .line 1259
    const/16 v1, 0x205

    const-wide/16 v2, 0x3e8

    .line 1258
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1260
    return-void
.end method

.method public static setCallAppParam(Ljava/lang/String;)V
    .locals 0
    .param p0, "passcode"    # Ljava/lang/String;

    .prologue
    .line 307
    sput-object p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mCallAppParam:Ljava/lang/String;

    .line 308
    return-void
.end method

.method public static setIsSetScreenOrientation(Z)V
    .locals 0
    .param p0, "state"    # Z

    .prologue
    .line 1346
    sput-boolean p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->isSetScreenOrientation:Z

    .line 1347
    return-void
.end method

.method private showBackgroundDialog(Ljava/lang/String;)V
    .locals 5
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 1238
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    if-nez v1, :cond_0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    if-eqz v1, :cond_0

    .line 1239
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1241
    :try_start_0
    new-instance v1, Lcom/boyaa/app/common/LoadingSceneDialog;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/app/common/LoadingSceneDialog;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    .line 1242
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mBackgroundDialog:Lcom/boyaa/app/common/LoadingSceneDialog;

    invoke-virtual {v1}, Lcom/boyaa/app/common/LoadingSceneDialog;->show()V

    .line 1244
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v1

    .line 1245
    const/16 v2, 0x205

    const-wide/16 v3, 0x2710

    .line 1244
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1252
    :cond_0
    :goto_0
    return-void

    .line 1246
    :catch_0
    move-exception v0

    .line 1247
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissBackgroundDialog()V

    goto :goto_0
.end method

.method private showLoadingDialog(Ljava/lang/String;)V
    .locals 7
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 1275
    const/4 v4, 0x0

    .line 1276
    .local v4, "msg":Ljava/lang/String;
    const-wide/16 v0, 0x2710

    .line 1278
    .local v0, "displayTime":J
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1279
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string v5, "msg"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1280
    const-string v5, "displayTime"

    invoke-virtual {v3, v5, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1282
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1284
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissLoadingDialog()V

    .line 1285
    iget-object v5, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    if-nez v5, :cond_0

    .line 1287
    new-instance v5, Lcom/boyaa/widget/LoadingDialog;

    invoke-direct {v5, p0, v0, v1}, Lcom/boyaa/widget/LoadingDialog;-><init>(Landroid/content/Context;J)V

    iput-object v5, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    .line 1289
    :cond_0
    iget-object v5, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Lcom/boyaa/widget/LoadingDialog;->showDialog(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1297
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-void

    .line 1291
    :catch_0
    move-exception v2

    .line 1292
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 1293
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 1294
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 8
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1308
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1309
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v6, "msg"

    const-string v7, ""

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1310
    .local v3, "msg":Ljava/lang/String;
    const-string v6, "long"

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    .line 1311
    .local v2, "longShow":I
    invoke-static {}, Lcom/boyaa/widget/BoyaaToast;->getInstance()Lcom/boyaa/widget/BoyaaToast;

    move-result-object v6

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 1312
    if-ne v2, v4, :cond_0

    .line 1311
    :goto_0
    invoke-virtual {v6, v7, v3, v4}, Lcom/boyaa/widget/BoyaaToast;->show(Landroid/content/Context;Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1316
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "longShow":I
    .end local v3    # "msg":Ljava/lang/String;
    :goto_1
    return-void

    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    .restart local v2    # "longShow":I
    .restart local v3    # "msg":Ljava/lang/String;
    :cond_0
    move v4, v5

    .line 1312
    goto :goto_0

    .line 1313
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "longShow":I
    .end local v3    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1314
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method private socketSleepDead()V
    .locals 1

    .prologue
    .line 1178
    const-string v0, "java2lua_socketDead"

    invoke-direct {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->callLua(Ljava/lang/String;)V

    .line 1179
    return-void
.end method

.method private socketWakeUp()V
    .locals 1

    .prologue
    .line 1170
    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    if-eqz v0, :cond_0

    .line 1171
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    .line 1172
    const-string v0, "java2lua_socketWakeUp"

    invoke-direct {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->callLua(Ljava/lang/String;)V

    .line 1175
    :cond_0
    return-void
.end method

.method private startSocketCount()V
    .locals 1

    .prologue
    .line 1123
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSocketCounterHander:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 1124
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/Game$20;

    invoke-direct {v0, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$20;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSocketCounterHander:Landroid/os/Handler;

    .line 1142
    :cond_0
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;

    invoke-direct {v0, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$21;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    .line 1164
    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->start()V

    .line 1167
    return-void
.end method

.method private startSocketSleep()V
    .locals 1

    .prologue
    .line 1109
    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    if-nez v0, :cond_0

    .line 1110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    .line 1111
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startSocketCount()V

    .line 1115
    :cond_0
    return-void
.end method

.method public static stopVibrate()V
    .locals 1

    .prologue
    .line 917
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->vib:Landroid/os/Vibrator;

    if-eqz v0, :cond_0

    .line 918
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->vib:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 920
    :cond_0
    return-void
.end method

.method public static vibrate([JI)V
    .locals 2
    .param p0, "pattern"    # [J
    .param p1, "t"    # I

    .prologue
    .line 912
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->vib:Landroid/os/Vibrator;

    .line 913
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->vib:Landroid/os/Vibrator;

    invoke-virtual {v0, p0, p1}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 914
    return-void
.end method


# virtual methods
.method public OnLuaCall()V
    .locals 1

    .prologue
    .line 165
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->OnLuaCall()V

    .line 167
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->getInstance()Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;->startLuaCall()Ljava/lang/String;

    .line 168
    return-void
.end method

.method public addShortcut()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 178
    const/4 v2, 0x0

    .line 180
    .local v2, "isInstallShortcut":Z
    const-string v5, "InstallShortcut"

    .line 179
    invoke-virtual {p0, v5, v8}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 181
    .local v3, "settings":Landroid/content/SharedPreferences;
    const-string v5, "isInstallShortcut"

    invoke-interface {v3, v5, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 182
    if-eqz v2, :cond_0

    .line 209
    :goto_0
    return-void

    .line 186
    :cond_0
    invoke-static {}, Lcom/boyaa/app/sys/SystemInfo;->setApkInstallTime()V

    .line 188
    new-instance v4, Landroid/content/Intent;

    .line 189
    const-string v5, "com.android.launcher.action.INSTALL_SHORTCUT"

    .line 188
    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 191
    .local v4, "shortcut":Landroid/content/Intent;
    const-string v5, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 192
    const v7, 0x7f070003

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 191
    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    const v5, 0x7f02000f

    .line 194
    invoke-static {p0, v5}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v1

    .line 196
    .local v1, "iconRes":Landroid/content/Intent$ShortcutIconResource;
    const-string v5, "android.intent.extra.shortcut.ICON_RESOURCE"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 197
    const-string v5, "duplicate"

    invoke-virtual {v4, v5, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 200
    const-string v5, "android.intent.extra.shortcut.INTENT"

    new-instance v6, Landroid/content/Intent;

    const-class v7, Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-direct {v6, p0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 203
    invoke-virtual {p0, v4}, Lcom/boyaa/enginedlqp/maindevelop/Game;->sendBroadcast(Landroid/content/Intent;)V

    .line 206
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 207
    .local v0, "e":Landroid/content/SharedPreferences$Editor;
    const-string v5, "isInstallShortcut"

    const/4 v6, 0x1

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 208
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public checkCallAppParam()V
    .locals 11

    .prologue
    .line 284
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 285
    .local v4, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v8, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v8}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 286
    .local v2, "intentCallApp":Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 287
    .local v0, "action":Ljava/lang/String;
    const-string v8, "android.intent.action.VIEW"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 288
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    .line 289
    .local v7, "uri":Landroid/net/Uri;
    if-eqz v7, :cond_0

    .line 290
    const-string v8, "benny"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "getCallAppParam uri "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    :try_start_0
    const-string v8, "boyaadfqpcode"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 293
    .local v6, "passcode":Ljava/lang/String;
    const-string v8, "boyaadfqpcode"

    invoke-virtual {v4, v8, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v8, "benny"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "getCallAppParam boyaadfqpcode "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    .end local v6    # "passcode":Ljava/lang/String;
    .end local v7    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    new-instance v3, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v3, v4}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 302
    .local v3, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v3}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v5

    .line 303
    .local v5, "param":Ljava/lang/String;
    invoke-static {v5}, Lcom/boyaa/enginedlqp/maindevelop/Game;->setCallAppParam(Ljava/lang/String;)V

    .line 304
    return-void

    .line 295
    .end local v3    # "jsonUtil":Lcom/boyaa/util/JsonUtil;
    .end local v5    # "param":Ljava/lang/String;
    .restart local v7    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 297
    .local v1, "e":Ljava/lang/Exception;
    const-string v8, "benny"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "getCallAppParam error "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public dismissStartDialogByJavaAndLua()V
    .locals 2

    .prologue
    .line 893
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v1}, Lcom/boyaa/app/AppStartDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 894
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v1}, Lcom/boyaa/app/AppStartDialog;->dismissOnLuaLoaded()Z

    move-result v0

    .line 895
    .local v0, "isDismissSuccess":Z
    if-eqz v0, :cond_0

    .line 896
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    .line 901
    .end local v0    # "isDismissSuccess":Z
    :cond_0
    :goto_0
    return-void

    .line 899
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->splashScreenFinish()V

    goto :goto_0
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->loadScreenBrightness()V

    .line 151
    new-instance v0, Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;

    invoke-direct {v0, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    sput-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->gameHandler:Landroid/os/Handler;

    .line 152
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v0, :cond_0

    .line 153
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->gameHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    .line 154
    const-wide/32 v2, 0x1d4c0

    .line 153
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 156
    :cond_0
    invoke-static {p0}, Lcom/boyaa/entity/statistics/Umeng;->init(Landroid/app/Activity;)V

    .line 157
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->addShortcut()V

    .line 159
    new-instance v0, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;

    invoke-direct {v0}, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;-><init>()V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->simListener:Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;

    .line 160
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->telMgr:Landroid/telephony/TelephonyManager;

    .line 161
    return-void
.end method

.method public initVersion(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1222
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1225
    .local v2, "packageManager":Landroid/content/pm/PackageManager;
    :try_start_0
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    .line 1224
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 1226
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionName:Ljava/lang/String;

    .line 1227
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    sput v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1232
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return-void

    .line 1229
    :catch_0
    move-exception v0

    .line 1230
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, ""

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 927
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v3

    invoke-virtual {v3, p1, p2, p3}, Lcom/boyaa/engine/device/Device;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 988
    :goto_0
    return-void

    .line 932
    :cond_0
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v3

    invoke-virtual {v3, p1, p2, p3}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onActivityResult(IILandroid/content/Intent;)V

    .line 934
    packed-switch p1, :pswitch_data_0

    .line 976
    if-nez p3, :cond_1

    .line 977
    new-instance p3, Landroid/content/Intent;

    .end local p3    # "data":Landroid/content/Intent;
    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    .line 979
    .restart local p3    # "data":Landroid/content/Intent;
    :cond_1
    const-string v2, "onRequestCode"

    invoke-virtual {p3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 980
    const-string v2, "onResultCode"

    invoke-virtual {p3, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 981
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v2

    .line 982
    const/16 v3, 0x4c9

    const-string v4, ""

    .line 981
    invoke-virtual {v2, v3, p3, v4}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 987
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 936
    :pswitch_0
    if-ne p2, v4, :cond_2

    .line 937
    invoke-static {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/boyaa/app/image/ChooseImageHandler;->onTakePhotoFinish(Landroid/content/Intent;)V

    goto :goto_1

    .line 941
    :pswitch_1
    if-ne p2, v4, :cond_2

    .line 942
    invoke-static {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/boyaa/app/image/ChooseImageHandler;->onPickPhotoFromGalleryFinish(Landroid/content/Intent;)V

    goto :goto_1

    .line 946
    :pswitch_2
    if-ne p2, v4, :cond_2

    .line 947
    invoke-static {p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/boyaa/app/image/ChooseImageHandler;->onSaveBitmap(Landroid/content/Intent;)V

    goto :goto_1

    .line 951
    :pswitch_3
    if-eq p2, v4, :cond_3

    if-nez p3, :cond_4

    .line 952
    :cond_3
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onOpenQQResult(Z)V

    goto :goto_1

    .line 954
    :cond_4
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onOpenQQResult(Z)V

    goto :goto_1

    .line 959
    :pswitch_4
    if-eq p2, v4, :cond_5

    if-nez p3, :cond_6

    .line 960
    :cond_5
    invoke-static {v1}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->onOpenWeiXinResult(Z)V

    goto :goto_1

    .line 962
    :cond_6
    invoke-static {v2}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->onOpenWeiXinResult(Z)V

    goto :goto_1

    .line 967
    :pswitch_5
    if-ne p2, v4, :cond_8

    .line 968
    .local v1, "isSuccess":Z
    :goto_2
    const-string v0, ""

    .line 969
    .local v0, "content":Ljava/lang/String;
    if-eqz p3, :cond_7

    .line 970
    const-string v2, "result"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 972
    :cond_7
    invoke-static {}, Lcom/boyaa/entity/QRUtil/QRUtil;->getInstance()Lcom/boyaa/entity/QRUtil/QRUtil;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/boyaa/entity/QRUtil/QRUtil;->responseScanQR(ZLjava/lang/String;)V

    goto :goto_1

    .end local v0    # "content":Ljava/lang/String;
    .end local v1    # "isSuccess":Z
    :cond_8
    move v1, v2

    .line 967
    goto :goto_2

    .line 934
    :pswitch_data_0
    .packed-switch 0x1001
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method protected onBeforeInitGL(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 343
    invoke-virtual {p0, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->initVersion(Landroid/content/Context;)V

    .line 348
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 117
    invoke-super {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 118
    invoke-super {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->CreateApp(Landroid/os/Bundle;)Z

    .line 119
    if-nez p1, :cond_0

    .line 120
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->showStartDialog()V

    .line 126
    :goto_0
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->init()V

    .line 127
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onCreate()V

    .line 129
    invoke-static {}, Lcom/boyaa/entity/service/ServiceHelper;->getInstance()Lcom/boyaa/entity/service/ServiceHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/service/ServiceHelper;->init()V

    .line 131
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->init()V

    .line 133
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->AlipaySimpleCheckAccount(Landroid/app/Activity;)V

    .line 134
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;

    move-result-object v2

    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v2, v3}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->login(Landroid/app/Activity;)V

    .line 140
    const v1, 0x9999

    .line 141
    .local v1, "requestCodeStart":I
    const v0, 0x9999

    .line 142
    .local v0, "permissionsRequestCodeStart":I
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v2

    invoke-virtual {v2, p0, v1, v0}, Lcom/boyaa/engine/device/Device;->init(Landroid/app/Activity;II)V

    .line 144
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 146
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v2}, Lcom/boyaa/extension/Clipboard;->init(Landroid/app/Activity;)V

    .line 147
    return-void

    .line 123
    .end local v0    # "permissionsRequestCodeStart":I
    .end local v1    # "requestCodeStart":I
    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1207
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissBackgroundDialog()V

    .line 1208
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissLoadingDialog()V

    .line 1209
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1210
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->dimissDialogImmediately()V

    .line 1211
    iput-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    .line 1214
    :cond_0
    sget-object v0, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->delView(Ljava/lang/String;)V

    .line 1215
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z

    .line 1217
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onDestroy()V

    .line 1218
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onDestroy()V

    .line 1219
    return-void
.end method

.method protected onHandleKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1002
    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    .line 1003
    const/16 v1, 0x52

    if-ne p1, v1, :cond_1

    .line 1004
    :cond_0
    move v0, p1

    .line 1005
    .local v0, "kc":I
    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/Game$18;

    invoke-direct {v1, p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/Game$18;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;I)V

    invoke-virtual {p0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 1011
    const/4 v1, 0x1

    .line 1013
    .end local v0    # "kc":I
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onHandleMessage(Landroid/os/Message;)V
    .locals 68
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 366
    sget-object v65, Lcom/boyaa/enginedlqp/maindevelop/Game;->mSyncMsgIds:Ljava/lang/Object;

    monitor-enter v65

    .line 367
    :try_start_0
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v66, v0

    invoke-static/range {v66 .. v66}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v66

    move-object/from16 v0, v64

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v64

    if-eqz v64, :cond_0

    .line 368
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v22, v0

    .line 369
    .local v22, "id":I
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v66

    move-object/from16 v0, v64

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v66, Lcom/boyaa/enginedlqp/maindevelop/Game$5;

    move-object/from16 v0, v66

    move-object/from16 v1, p0

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$5;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;I)V

    move-object/from16 v0, v64

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 366
    .end local v22    # "id":I
    :cond_0
    monitor-exit v65
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v64, v0

    sparse-switch v64, :sswitch_data_0

    .line 848
    :cond_1
    :goto_0
    :sswitch_0
    return-void

    .line 366
    :catchall_0
    move-exception v64

    :try_start_1
    monitor-exit v65
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v64

    .line 384
    :sswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissStartDialogByJavaAndLua()V

    goto :goto_0

    .line 388
    :sswitch_2
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v64

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v65, v0

    const-string v66, ""

    const-string v67, ""

    invoke-virtual/range {v64 .. v67}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 391
    :sswitch_3
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v10

    .line 392
    .local v10, "bundleSms":Landroid/os/Bundle;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v64

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v65, v0

    .line 393
    const-string v66, "data"

    move-object/from16 v0, v66

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    const-string v67, ""

    .line 392
    invoke-virtual/range {v64 .. v67}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 397
    .end local v10    # "bundleSms":Landroid/os/Bundle;
    :sswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v9

    .line 398
    .local v9, "bundleSaveHeadImage":Landroid/os/Bundle;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;

    move-result-object v64

    move-object/from16 v0, v64

    invoke-virtual {v0, v9}, Lcom/boyaa/app/image/ChooseImageHandler;->startUploadHeadImage(Landroid/os/Bundle;)V

    goto :goto_0

    .line 401
    .end local v9    # "bundleSaveHeadImage":Landroid/os/Bundle;
    :sswitch_5
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v8

    .line 402
    .local v8, "bundleCImage":Landroid/os/Bundle;
    invoke-static/range {p0 .. p0}, Lcom/boyaa/app/image/ChooseImageHandler;->getInstance(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/image/ChooseImageHandler;

    move-result-object v64

    move-object/from16 v0, v64

    invoke-virtual {v0, v8}, Lcom/boyaa/app/image/ChooseImageHandler;->startUploadFeedbackImage(Landroid/os/Bundle;)V

    goto :goto_0

    .line 405
    .end local v8    # "bundleCImage":Landroid/os/Bundle;
    :sswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v11

    .line 406
    .local v11, "bundleULFeedbackImage":Landroid/os/Bundle;
    new-instance v64, Lcom/boyaa/app/image/UploadFeedbackImage;

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/boyaa/app/image/UploadFeedbackImage;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Landroid/os/Bundle;)V

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->uploadFeedImage:Lcom/boyaa/app/image/UploadFeedbackImage;

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->uploadFeedImage:Lcom/boyaa/app/image/UploadFeedbackImage;

    move-object/from16 v64, v0

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/image/UploadFeedbackImage;->doUploadPhotoAction()V

    goto :goto_0

    .line 410
    .end local v11    # "bundleULFeedbackImage":Landroid/os/Bundle;
    :sswitch_7
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v55

    .line 411
    .local v55, "soundPathBundle":Landroid/os/Bundle;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v64

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v65, v0

    .line 412
    const-string v66, "data"

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v66

    const-string v67, ""

    .line 411
    invoke-virtual/range {v64 .. v67}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 416
    .end local v55    # "soundPathBundle":Landroid/os/Bundle;
    :sswitch_8
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-direct {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->showBackgroundDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 420
    :sswitch_9
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->sendDelayMessage()V

    goto/16 :goto_0

    .line 424
    :sswitch_a
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissBackgroundDialog()V

    goto/16 :goto_0

    .line 428
    :sswitch_b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-direct {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->showLoadingDialog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 432
    :sswitch_c
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->dismissLoadingDialog()V

    goto/16 :goto_0

    .line 436
    :sswitch_d
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-direct {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 441
    :sswitch_e
    invoke-static {}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->getInstance()Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    move-result-object v65

    .line 442
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v66, "data"

    move-object/from16 v0, v64

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    .line 441
    move-object/from16 v0, v65

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->init(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 447
    :sswitch_f
    invoke-static {}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->getInstance()Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    move-result-object v64

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->delView()V

    goto/16 :goto_0

    .line 452
    :sswitch_10
    invoke-static {}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->getInstance()Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    move-result-object v64

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->hideWebView()V

    goto/16 :goto_0

    .line 485
    :sswitch_11
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v50, v0

    check-cast v50, Ljava/lang/String;

    .line 486
    .local v50, "send_feedback":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$6;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v50

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$6;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 506
    .end local v50    # "send_feedback":Ljava/lang/String;
    :sswitch_12
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v51, v0

    check-cast v51, Ljava/lang/String;

    .line 507
    .local v51, "send_feedback_closeTicket":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$7;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v51

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$7;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 528
    .end local v51    # "send_feedback_closeTicket":Ljava/lang/String;
    :sswitch_13
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v41, v0

    check-cast v41, Ljava/lang/String;

    .line 529
    .local v41, "re_send_feedback":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$8;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$8;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 542
    .end local v41    # "re_send_feedback":Ljava/lang/String;
    :sswitch_14
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 543
    .local v36, "param":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v64

    invoke-virtual/range {v64 .. v64}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v64

    move-object/from16 v0, v64

    iget v7, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 545
    .local v7, "brightness":F
    :try_start_2
    new-instance v28, Lorg/json/JSONObject;

    move-object/from16 v0, v28

    move-object/from16 v1, v36

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 546
    .local v28, "json":Lorg/json/JSONObject;
    const-string v64, "brightness"

    move-object/from16 v0, v28

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-wide v64

    move-wide/from16 v0, v64

    double-to-float v7, v0

    .line 551
    .end local v28    # "json":Lorg/json/JSONObject;
    :goto_1
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 552
    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v64

    invoke-virtual/range {v64 .. v64}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v31

    .line 554
    .local v31, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    float-to-double v0, v7

    move-wide/from16 v64, v0

    const-wide v66, 0x3fb999999999999aL    # 0.1

    cmpl-double v64, v64, v66

    if-ltz v64, :cond_2

    .line 555
    move-object/from16 v0, v31

    iput v7, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 557
    :cond_2
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v64

    move-object/from16 v0, v64

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    goto/16 :goto_0

    .line 547
    .end local v31    # "layoutParams":Landroid/view/WindowManager$LayoutParams;
    :catch_0
    move-exception v16

    .line 548
    .local v16, "e":Lorg/json/JSONException;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 561
    .end local v7    # "brightness":F
    .end local v16    # "e":Lorg/json/JSONException;
    .end local v36    # "param":Ljava/lang/String;
    :sswitch_15
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v62

    .line 562
    .local v62, "webViewParam":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    move-object/from16 v0, v64

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->newWebView(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 565
    .end local v62    # "webViewParam":Ljava/lang/String;
    :sswitch_16
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v63

    .line 566
    .local v63, "webViewUrl":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    move-object/from16 v0, v64

    move-object/from16 v1, v63

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->setWebViewUrl(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 570
    .end local v63    # "webViewUrl":Ljava/lang/String;
    :sswitch_17
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/EmbedWebView;->goBackWebView()V

    goto/16 :goto_0

    .line 573
    :sswitch_18
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 574
    .local v37, "paramDel":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    move-object/from16 v0, v64

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/boyaa/app/EmbedWebView;->delView(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 577
    .end local v37    # "paramDel":Ljava/lang/String;
    :sswitch_19
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/EmbedWebView;->hideView()V

    goto/16 :goto_0

    .line 581
    :sswitch_1a
    sget-object v64, Lcom/boyaa/app/EmbedWebView;->instance:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/EmbedWebView;->showView()V

    goto/16 :goto_0

    .line 585
    :sswitch_1b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v61

    .line 587
    .local v61, "updateParam":Ljava/lang/String;
    :try_start_3
    new-instance v28, Lorg/json/JSONObject;

    move-object/from16 v0, v28

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 589
    .restart local v28    # "json":Lorg/json/JSONObject;
    const-string v64, "download_path"

    const-string v65, ""

    .line 588
    move-object/from16 v0, v28

    move-object/from16 v1, v64

    move-object/from16 v2, v65

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 590
    .local v15, "downloadPath":Ljava/lang/String;
    const-string v64, "save_path"

    .line 591
    const-string v65, ""

    .line 590
    move-object/from16 v0, v28

    move-object/from16 v1, v64

    move-object/from16 v2, v65

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    .line 592
    .local v49, "savePath":Ljava/lang/String;
    new-instance v26, Landroid/content/Intent;

    .line 593
    const-class v64, Lcom/boyaa/downloader/service/DownloadService;

    .line 592
    move-object/from16 v0, v26

    move-object/from16 v1, p0

    move-object/from16 v2, v64

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 594
    .local v26, "intentDownload":Landroid/content/Intent;
    const-string v64, "download_path"

    move-object/from16 v0, v26

    move-object/from16 v1, v64

    invoke-virtual {v0, v1, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 597
    const-string v64, "save_path"

    move-object/from16 v0, v26

    move-object/from16 v1, v64

    move-object/from16 v2, v49

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 599
    const-string v64, "start_type"

    .line 600
    const/16 v65, 0x2

    .line 599
    move-object/from16 v0, v26

    move-object/from16 v1, v64

    move/from16 v2, v65

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 601
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    .line 602
    .end local v15    # "downloadPath":Ljava/lang/String;
    .end local v26    # "intentDownload":Landroid/content/Intent;
    .end local v28    # "json":Lorg/json/JSONObject;
    .end local v49    # "savePath":Ljava/lang/String;
    :catch_1
    move-exception v16

    .line 603
    .restart local v16    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 607
    .end local v16    # "e":Lorg/json/JSONException;
    .end local v61    # "updateParam":Ljava/lang/String;
    :sswitch_1c
    invoke-static/range {p0 .. p1}, Lcom/boyaa/downloader/util/ApkInstallHelper;->installApk(Landroid/content/Context;Landroid/os/Message;)V

    goto/16 :goto_0

    .line 611
    :sswitch_1d
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v65

    const-string v66, "data"

    invoke-virtual/range {v65 .. v66}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v65

    invoke-static/range {v64 .. v65}, Lcom/boyaa/entity/statistics/Umeng;->event(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 615
    :sswitch_1e
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v65

    const-string v66, "data"

    invoke-virtual/range {v65 .. v66}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v65

    invoke-static/range {v64 .. v65}, Lcom/boyaa/entity/statistics/Umeng;->error(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 621
    :sswitch_1f
    const-string v64, "http://www.boyaa.com/mobile/termsofservice1.html"

    invoke-static/range {v64 .. v64}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v57

    .line 622
    .local v57, "termsUri":Landroid/net/Uri;
    new-instance v56, Landroid/content/Intent;

    const-string v64, "android.intent.action.VIEW"

    move-object/from16 v0, v56

    move-object/from16 v1, v64

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 623
    .local v56, "termsIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 627
    .end local v56    # "termsIntent":Landroid/content/Intent;
    .end local v57    # "termsUri":Landroid/net/Uri;
    :sswitch_20
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v14

    .line 628
    .local v14, "download":Landroid/os/Bundle;
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v65

    .line 629
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v66, v0

    const-string v64, "data"

    move-object/from16 v0, v64

    invoke-virtual {v14, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v67

    .line 630
    const-string v64, "callLuaEvent"

    move-object/from16 v0, v64

    invoke-virtual {v14, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    .line 629
    move-object/from16 v0, v65

    move/from16 v1, v66

    move-object/from16 v2, v67

    move-object/from16 v3, v64

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 633
    .end local v14    # "download":Landroid/os/Bundle;
    :sswitch_21
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v43

    .line 634
    .local v43, "saveFile":Landroid/os/Bundle;
    const-string v64, "httpUrl"

    move-object/from16 v0, v43

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 635
    .local v20, "httpUrl":Ljava/lang/String;
    const-string v64, "savePath"

    move-object/from16 v0, v43

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    .line 636
    .local v44, "saveFilePath":Ljava/lang/String;
    const-string v64, "timeout"

    move-object/from16 v0, v43

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v58

    .line 638
    .local v58, "timeout":I
    new-instance v18, Lcom/boyaa/app/file/FileDownload;

    invoke-direct/range {v18 .. v18}, Lcom/boyaa/app/file/FileDownload;-><init>()V

    .line 640
    .local v18, "fileDownLoad":Lcom/boyaa/app/file/FileDownload;
    const-string v64, "callLuaEvent"

    move-object/from16 v0, v43

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    .line 639
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-object/from16 v2, v44

    move/from16 v3, v58

    move-object/from16 v4, v64

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/boyaa/app/file/FileDownload;->onDoDownload(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 643
    .end local v18    # "fileDownLoad":Lcom/boyaa/app/file/FileDownload;
    .end local v20    # "httpUrl":Ljava/lang/String;
    .end local v43    # "saveFile":Landroid/os/Bundle;
    .end local v44    # "saveFilePath":Ljava/lang/String;
    .end local v58    # "timeout":I
    :sswitch_22
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v46

    .line 644
    .local v46, "saveFileZip":Landroid/os/Bundle;
    const-string v64, "httpUrl"

    move-object/from16 v0, v46

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 645
    .local v21, "httpUrlZip":Ljava/lang/String;
    const-string v64, "savePath"

    move-object/from16 v0, v46

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    .line 646
    .local v45, "saveFilePathZip":Ljava/lang/String;
    const-string v64, "timeout"

    move-object/from16 v0, v46

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v59

    .line 647
    .local v59, "timeoutZip":I
    new-instance v19, Lcom/boyaa/app/file/FileUnZip;

    invoke-direct/range {v19 .. v19}, Lcom/boyaa/app/file/FileUnZip;-><init>()V

    .line 648
    .local v19, "fileUnZip":Lcom/boyaa/app/file/FileUnZip;
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v45

    move/from16 v3, v59

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/file/FileUnZip;->doDownLoad(Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 651
    .end local v19    # "fileUnZip":Lcom/boyaa/app/file/FileUnZip;
    .end local v21    # "httpUrlZip":Ljava/lang/String;
    .end local v45    # "saveFilePathZip":Ljava/lang/String;
    .end local v46    # "saveFileZip":Landroid/os/Bundle;
    .end local v59    # "timeoutZip":I
    :sswitch_23
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v54

    .line 652
    .local v54, "showDialogBundle":Landroid/os/Bundle;
    const-string v64, "tips"

    move-object/from16 v0, v54

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v60

    .line 653
    .local v60, "tips":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    move-object/from16 v0, v64

    move-object/from16 v1, v60

    invoke-static {v0, v1}, Lcom/boyaa/app/common/BoyaaProgressDialog;->show(Landroid/app/Activity;Ljava/lang/CharSequence;)Lcom/boyaa/app/common/BoyaaProgressDialog;

    move-result-object v64

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    goto/16 :goto_0

    .line 656
    .end local v54    # "showDialogBundle":Landroid/os/Bundle;
    .end local v60    # "tips":Ljava/lang/String;
    :sswitch_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    move-object/from16 v64, v0

    if-eqz v64, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    move-object/from16 v64, v0

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/common/BoyaaProgressDialog;->isShowing()Z

    move-result v64

    if-eqz v64, :cond_1

    .line 657
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    move-object/from16 v64, v0

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/app/common/BoyaaProgressDialog;->dismiss()V

    .line 658
    const/16 v64, 0x0

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    goto/16 :goto_0

    .line 672
    :sswitch_25
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v64

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v65, v0

    .line 673
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v66

    const-string v67, "data"

    invoke-virtual/range {v66 .. v67}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    const-string v67, ""

    .line 672
    invoke-virtual/range {v64 .. v67}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 681
    :sswitch_26
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 682
    .local v29, "jsonstr":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Lcom/boyaa/extension/Telephone;->autoDial(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 685
    .end local v29    # "jsonstr":Ljava/lang/String;
    :sswitch_27
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 686
    .local v30, "jsonstr2":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lcom/boyaa/extension/Telephone;->autoSelectDial(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 689
    .end local v30    # "jsonstr2":Ljava/lang/String;
    :sswitch_28
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-static {v0, v1}, Lcom/boyaa/extension/WebPage;->load(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 692
    :sswitch_29
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v6

    .line 693
    .local v6, "apkPathBundle":Landroid/os/Bundle;
    const-string v64, "newApkPath"

    move-object/from16 v0, v64

    invoke-virtual {v6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 694
    .local v32, "newApkPath":Ljava/lang/String;
    new-instance v5, Lcom/boyaa/engine/patchupdate/ApkInstall;

    invoke-direct {v5}, Lcom/boyaa/engine/patchupdate/ApkInstall;-><init>()V

    .line 695
    .local v5, "apkInstall":Lcom/boyaa/engine/patchupdate/ApkInstall;
    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Lcom/boyaa/engine/patchupdate/ApkInstall;->startInstall(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 698
    .end local v5    # "apkInstall":Lcom/boyaa/engine/patchupdate/ApkInstall;
    .end local v6    # "apkPathBundle":Landroid/os/Bundle;
    .end local v32    # "newApkPath":Ljava/lang/String;
    :sswitch_2a
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v53

    .line 699
    .local v53, "shareData":Landroid/os/Bundle;
    const-string v64, "isSuccess"

    move-object/from16 v0, v53

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v27

    .line 700
    .local v27, "isSuccess":I
    const-string v64, "shareChannel"

    move-object/from16 v0, v53

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    .line 702
    .local v52, "shareChannel":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$9;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move/from16 v2, v27

    move-object/from16 v3, v52

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/enginedlqp/maindevelop/Game$9;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;ILjava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 720
    .end local v27    # "isSuccess":I
    .end local v52    # "shareChannel":Ljava/lang/String;
    .end local v53    # "shareData":Landroid/os/Bundle;
    :sswitch_2b
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v47

    .line 721
    .local v47, "saveImageInfo":Landroid/os/Bundle;
    const-string v64, "path"

    move-object/from16 v0, v47

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 722
    .local v24, "imagePath":Ljava/lang/String;
    const-string v64, "photoName"

    move-object/from16 v0, v47

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    .line 723
    .local v38, "photoName":Ljava/lang/String;
    const-string v64, "isSuccess"

    move-object/from16 v0, v47

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v48

    .line 724
    .local v48, "saveImageIsSuccess":I
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$10;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v24

    move-object/from16 v3, v38

    move/from16 v4, v48

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/boyaa/enginedlqp/maindevelop/Game$10;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 743
    .end local v24    # "imagePath":Ljava/lang/String;
    .end local v38    # "photoName":Ljava/lang/String;
    .end local v47    # "saveImageInfo":Landroid/os/Bundle;
    .end local v48    # "saveImageIsSuccess":I
    :sswitch_2c
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v34

    .line 744
    .local v34, "openShareData":Landroid/os/Bundle;
    const-string v64, "resultCode"

    move-object/from16 v0, v34

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v35

    .line 745
    .local v35, "openSuccess":I
    const-string v64, "openShareChannel"

    move-object/from16 v0, v34

    move-object/from16 v1, v64

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 747
    .local v33, "openChannel":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$11;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move/from16 v2, v35

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3}, Lcom/boyaa/enginedlqp/maindevelop/Game$11;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;ILjava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 765
    .end local v33    # "openChannel":Ljava/lang/String;
    .end local v34    # "openShareData":Landroid/os/Bundle;
    .end local v35    # "openSuccess":I
    :sswitch_2d
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Ljava/lang/String;

    .line 766
    .local v42, "result":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$12;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v42

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$12;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 778
    .end local v42    # "result":Ljava/lang/String;
    :sswitch_2e
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, Ljava/lang/String;

    .line 779
    .local v23, "imResult":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$13;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$13;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 790
    .end local v23    # "imResult":Ljava/lang/String;
    :sswitch_2f
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "text"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 791
    .local v12, "content":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/boyaa/util/SmsUtil;->OpenSms(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 795
    .end local v12    # "content":Ljava/lang/String;
    :sswitch_30
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 796
    .local v13, "data":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/boyaa/util/SmsUtil;->openSmsEdit(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 800
    .end local v13    # "data":Ljava/lang/String;
    :sswitch_31
    invoke-static {}, Lcom/boyaa/entity/QRUtil/QRUtil;->getInstance()Lcom/boyaa/entity/QRUtil/QRUtil;

    move-result-object v64

    invoke-virtual/range {v64 .. v64}, Lcom/boyaa/entity/QRUtil/QRUtil;->scanQR()V

    goto/16 :goto_0

    .line 804
    :sswitch_32
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v39, v0

    check-cast v39, Ljava/lang/String;

    .line 805
    .local v39, "qrCreateResult":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$14;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v39

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$14;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 817
    .end local v39    # "qrCreateResult":Ljava/lang/String;
    :sswitch_33
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v40, v0

    check-cast v40, Ljava/lang/String;

    .line 818
    .local v40, "qrScanResult":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$15;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v40

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$15;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 830
    .end local v40    # "qrScanResult":Ljava/lang/String;
    :sswitch_34
    new-instance v25, Landroid/content/Intent;

    const-string v64, "android.settings.SETTINGS"

    move-object/from16 v0, v25

    move-object/from16 v1, v64

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 831
    .local v25, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 834
    .end local v25    # "intent":Landroid/content/Intent;
    :sswitch_35
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v64

    const-string v65, "data"

    invoke-virtual/range {v64 .. v65}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v64

    invoke-direct {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->changeScreenOrientation(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 837
    :sswitch_36
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v17, v0

    check-cast v17, Ljava/lang/String;

    .line 838
    .local v17, "enterServiceResult":Ljava/lang/String;
    sget-object v64, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v65, Lcom/boyaa/enginedlqp/maindevelop/Game$16;

    move-object/from16 v0, v65

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$16;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V

    invoke-virtual/range {v64 .. v65}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 379
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_1
        0x1ff -> :sswitch_2
        0x202 -> :sswitch_2
        0x203 -> :sswitch_8
        0x204 -> :sswitch_9
        0x205 -> :sswitch_a
        0x208 -> :sswitch_3
        0x2c6 -> :sswitch_25
        0x2c7 -> :sswitch_25
        0x2c8 -> :sswitch_25
        0x2c9 -> :sswitch_25
        0x2ca -> :sswitch_25
        0x2cb -> :sswitch_25
        0x2cc -> :sswitch_25
        0x2cd -> :sswitch_25
        0x2ce -> :sswitch_25
        0x2cf -> :sswitch_25
        0x32d -> :sswitch_4
        0x3f2 -> :sswitch_7
        0x45b -> :sswitch_e
        0x45c -> :sswitch_f
        0x45d -> :sswitch_0
        0x45e -> :sswitch_11
        0x45f -> :sswitch_13
        0x4b0 -> :sswitch_0
        0x4b1 -> :sswitch_0
        0x4b2 -> :sswitch_14
        0x4b3 -> :sswitch_15
        0x4b4 -> :sswitch_16
        0x4b5 -> :sswitch_17
        0x4b6 -> :sswitch_18
        0x4b7 -> :sswitch_1b
        0x4b8 -> :sswitch_1c
        0x4b9 -> :sswitch_2a
        0x4ba -> :sswitch_2c
        0x4bb -> :sswitch_1d
        0x4bc -> :sswitch_1f
        0x4bd -> :sswitch_0
        0x4bf -> :sswitch_12
        0x4c0 -> :sswitch_0
        0x4c1 -> :sswitch_1e
        0x4c2 -> :sswitch_20
        0x4c3 -> :sswitch_21
        0x4c4 -> :sswitch_22
        0x4c5 -> :sswitch_23
        0x4c6 -> :sswitch_24
        0x4c7 -> :sswitch_0
        0x4ca -> :sswitch_26
        0x4cc -> :sswitch_28
        0x4d8 -> :sswitch_29
        0x4d9 -> :sswitch_b
        0x4da -> :sswitch_c
        0x4db -> :sswitch_d
        0x4dc -> :sswitch_0
        0x4de -> :sswitch_5
        0x4df -> :sswitch_6
        0x4ed -> :sswitch_19
        0x4ee -> :sswitch_1a
        0x4ef -> :sswitch_2d
        0x4f0 -> :sswitch_2e
        0x4f1 -> :sswitch_2f
        0x4f5 -> :sswitch_31
        0x4f6 -> :sswitch_32
        0x4f7 -> :sswitch_33
        0x4f8 -> :sswitch_27
        0x4f9 -> :sswitch_30
        0x4fa -> :sswitch_34
        0x4fb -> :sswitch_35
        0x4fe -> :sswitch_2b
        0x4ff -> :sswitch_36
        0x7d0 -> :sswitch_10
    .end sparse-switch
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 991
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onNewIntent(Landroid/content/Intent;)V

    .line 993
    if-eqz p1, :cond_0

    .line 994
    invoke-virtual {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->setIntent(Landroid/content/Intent;)V

    .line 995
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "onNewIntent"

    invoke-virtual {v0, v1, p1}, Lcom/boyaa/app/core/HandlerManager;->handle(Ljava/lang/String;Ljava/lang/Object;)V

    .line 997
    :cond_0
    invoke-super {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 998
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 1082
    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsPaying:Z

    if-eqz v0, :cond_1

    .line 1083
    const-string v0, "guangli.liu"

    const-string v1, "---------------------pay Call onPause------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1090
    :goto_0
    const-string v0, "guangli.liu"

    const-string v1, "---------------------onPause------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1092
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/engine/device/Device;->onPause()V

    .line 1093
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onPause()V

    .line 1095
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onPause()V

    .line 1096
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onPause(Landroid/content/Context;)V

    .line 1098
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->telMgr:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->simListener:Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1100
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    if-eqz v0, :cond_0

    .line 1101
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1102
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    .line 1104
    :cond_0
    return-void

    .line 1087
    :cond_1
    const-string v0, "guangli.liu"

    const-string v1, "---------------------\u5f00\u59cbsockect\u4f11\u7720\u8ba1\u65f6------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->startSocketSleep()V

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 1327
    const-string v0, "guangli.liu"

    const-string v1, "---------------------onRestart------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1328
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onRestart()V

    .line 1330
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v0, :cond_0

    .line 1331
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->restartByParent()V

    .line 1334
    :cond_0
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onRestart()V

    .line 1335
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 1040
    const-string v0, "guangli.liu"

    const-string v1, "---------------------onResume------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1041
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->checkCallAppParam()V

    .line 1043
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsPaying:Z

    .line 1044
    invoke-direct {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->socketWakeUp()V

    .line 1048
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/engine/device/Device;->onResume()V

    .line 1050
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsActivityCreated:Z

    .line 1051
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onResume()V

    .line 1053
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onResume()V

    .line 1054
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 1056
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->telMgr:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->simListener:Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;

    const/16 v2, 0x100

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1058
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    if-nez v0, :cond_0

    .line 1059
    new-instance v0, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    invoke-direct {v0}, Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;-><init>()V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    .line 1060
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->wifiReceiver:Lcom/boyaa/app/sys/WifiStrengthBroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.wifi.RSSI_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1064
    :cond_0
    invoke-static {}, Lcom/boyaa/util/SDCardUtil;->isSDCardAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1066
    const-string v0, "Game onResume()"

    const-string v1, "no sd !"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1067
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1068
    const v1, 0x7f070044

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1069
    const v1, 0x7f070045

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1070
    const v1, 0x7f070046

    .line 1071
    new-instance v2, Lcom/boyaa/enginedlqp/maindevelop/Game$19;

    invoke-direct {v2, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$19;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    .line 1070
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1075
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1077
    :cond_1
    return-void
.end method

.method protected onStart()V
    .locals 4

    .prologue
    .line 1018
    const-string v2, "guangli.liu"

    const-string v3, "---------------------onStart------------"

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onStart()V

    .line 1021
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onStart()V

    .line 1022
    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v2, :cond_0

    .line 1023
    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v2}, Lcom/boyaa/app/AppStartDialog;->show()V

    .line 1028
    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v2}, Lcom/boyaa/app/AppStartDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    .line 1029
    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1030
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1031
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 1032
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 1033
    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 1034
    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v2}, Lcom/boyaa/app/AppStartDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1036
    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    .end local v1    # "params":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 1195
    const-string v0, "guangli.liu"

    const-string v1, "---------------------onStop------------"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1196
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-eqz v0, :cond_0

    .line 1197
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->stopByParent()V

    .line 1200
    :cond_0
    invoke-super {p0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onStop()V

    .line 1202
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->onStop()V

    .line 1203
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 213
    if-eqz p1, :cond_0

    .line 214
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/Game$1;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 224
    :cond_0
    invoke-super {p0, p1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->onWindowFocusChanged(Z)V

    .line 225
    return-void
.end method

.method protected showDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 317
    return-void
.end method

.method public showStartDialog()V
    .locals 2

    .prologue
    .line 874
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    if-nez v0, :cond_0

    .line 875
    new-instance v0, Lcom/boyaa/app/AppStartDialog;

    invoke-direct {v0, p0}, Lcom/boyaa/app/AppStartDialog;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    .line 876
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/Game$17;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$17;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/app/AppStartDialog;->setLoadingListener(Lcom/boyaa/app/AppStartDialog$AppLoadingListener;)V

    .line 887
    :cond_0
    return-void
.end method

.method protected showdialog()V
    .locals 4

    .prologue
    .line 352
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u63d0\u793a"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 353
    const-string v2, "\u4f60\u7684\u624b\u673a\u6ca1\u6709sd\u5361,\u6e38\u620f\u4e0d\u652f\u6301"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 354
    const-string v2, "\u786e\u5b9a"

    new-instance v3, Lcom/boyaa/enginedlqp/maindevelop/Game$4;

    invoke-direct {v3, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$4;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 358
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 360
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 362
    return-void
.end method

.method public splashScreenFinish()V
    .locals 2

    .prologue
    .line 231
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/Game$2;

    invoke-direct {v1, p0}, Lcom/boyaa/enginedlqp/maindevelop/Game$2;-><init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 242
    return-void
.end method
