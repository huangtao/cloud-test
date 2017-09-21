.class public Lcom/boyaa/engine/made/AppActivity;
.super Landroid/app/Activity;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/made/AppActivity$AppHandler;
    }
.end annotation


# static fields
.field protected static final HANDLER_HTTPPOST_TIMEOUT:I = 0x1

.field protected static final TIMEOUT_MSG_ID_BEGIN:I = 0x3e8

.field protected static final TIMEOUT_MSG_ID_END:I = 0x7d0

.field public static final kFalse:I = 0x0

.field public static final kNone:I = -0x1

.field public static final kTrue:I = 0x1

.field private static mHandler:Landroid/os/Handler;

.field private static mSyncMsgIds:Ljava/lang/Object;

.field private static mThis:Lcom/boyaa/engine/made/AppActivity;

.field private static mTimeoutMsgIds:Ljava/util/HashMap;
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


# instance fields
.field private mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/made/AppActivity;->mHandler:Landroid/os/Handler;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppActivity;->mSyncMsgIds:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    .line 239
    return-void
.end method

.method public static ClearTimeout(I)V
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 220
    sget-object v1, Lcom/boyaa/engine/made/AppActivity;->mSyncMsgIds:Ljava/lang/Object;

    monitor-enter v1

    .line 221
    :try_start_0
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeMessages(I)V

    .line 225
    :cond_0
    monitor-exit v1

    .line 226
    return-void

    .line 225
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static SetScreenOrientation(Z)V
    .locals 2
    .param p0, "flag"    # Z

    .prologue
    .line 143
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    if-nez v0, :cond_0

    .line 159
    :goto_0
    return-void

    .line 146
    :cond_0
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    new-instance v1, Lcom/boyaa/engine/made/AppActivity$3;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/made/AppActivity$3;-><init>(Z)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static SetTimeout(IJ)V
    .locals 4
    .param p0, "id"    # I
    .param p1, "ms"    # J

    .prologue
    .line 203
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7d0

    if-lt p0, v0, :cond_1

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 206
    :cond_1
    sget-object v1, Lcom/boyaa/engine/made/AppActivity;->mSyncMsgIds:Ljava/lang/Object;

    monitor-enter v1

    .line 207
    :try_start_0
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 208
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method static synthetic access$100()Lcom/boyaa/engine/made/AppActivity;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mSyncMsgIds:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;

    return-object v0
.end method

.method public static checkThread()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 267
    :try_start_0
    sget-object v2, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    iget-object v2, v2, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v2, :cond_0

    .line 268
    sget-object v2, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    iget-object v2, v2, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->isGLThread()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    .line 269
    const/4 v1, 0x1

    .line 275
    .local v0, "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return v1

    .line 273
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 274
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 233
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/engine/made/AppActivity;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    return-object v0
.end method


# virtual methods
.method public OnBeforeLuaLoad()V
    .locals 0

    .prologue
    .line 104
    return-void
.end method

.method public OnLuaCall()V
    .locals 0

    .prologue
    .line 140
    return-void
.end method

.method public OnSetEnv()V
    .locals 0

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppActivity;->clearAllExternalStorageWhenInstall()V

    .line 80
    return-void
.end method

.method public clearAllExternalStorageWhenInstall()V
    .locals 0

    .prologue
    .line 87
    return-void
.end method

.method public getGLView()Lcom/boyaa/engine/made/AppGLSurfaceView;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    return-object v0
.end method

.method public onBeforeKillProcess()V
    .locals 0

    .prologue
    .line 192
    invoke-static {}, Lcom/boyaa/engine/made/AppSound;->end()V

    .line 193
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 164
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 165
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 44
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const-string v0, "Application"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JAR version:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/boyaa/engine/made/SystemInfo;->getNativeVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    sput-object p0, Lcom/boyaa/engine/made/AppActivity;->mThis:Lcom/boyaa/engine/made/AppActivity;

    .line 47
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/boyaa/engine/made/AppGLSurfaceView;-><init>(Landroid/content/Context;ZII)V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    .line 48
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0, v4}, Lcom/boyaa/engine/made/AppGLSurfaceView;->setBackgroundColor(I)V

    .line 49
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppActivity;->setContentView(Landroid/view/View;)V

    .line 50
    new-instance v0, Lcom/boyaa/engine/made/AppActivity$AppHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/boyaa/engine/made/AppActivity$AppHandler;-><init>(Lcom/boyaa/engine/made/AppActivity$1;)V

    sput-object v0, Lcom/boyaa/engine/made/AppActivity;->mHandler:Landroid/os/Handler;

    .line 51
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-static {v0}, Lcom/boyaa/engine/made/CallLuaHelper;->init(Lcom/boyaa/engine/made/AppGLSurfaceView;)V

    .line 52
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 185
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 186
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 60
    move v0, p1

    .line 61
    .local v0, "key":I
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    new-instance v2, Lcom/boyaa/engine/made/AppActivity$1;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/engine/made/AppActivity$1;-><init>(Lcom/boyaa/engine/made/AppActivity;I)V

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 68
    const/4 v1, 0x1

    .line 70
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, v0, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    new-instance v1, Lcom/boyaa/engine/made/AppActivity$2;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/made/AppActivity$2;-><init>(Lcom/boyaa/engine/made/AppActivity;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 115
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 177
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 178
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onPause()V

    .line 181
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 169
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 170
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onResume()V

    .line 173
    :cond_0
    return-void
.end method

.method public runOnLuaThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "ra"    # Ljava/lang/Runnable;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/boyaa/engine/made/AppActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 96
    :cond_0
    return-void
.end method
