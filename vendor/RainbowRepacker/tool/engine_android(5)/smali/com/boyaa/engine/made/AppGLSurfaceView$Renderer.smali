.class Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;
.super Ljava/lang/Object;
.source "AppGLSurfaceView.java"

# interfaces
.implements Lcom/boyaa/engine/made/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppGLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Renderer"
.end annotation


# static fields
.field private static mLuaEventObj:Ljava/lang/Object;


# instance fields
.field private mFirstChange:Z

.field private mLuaEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 439
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventObj:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 437
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 438
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventQueue:Ljava/util/ArrayList;

    .line 456
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mFirstChange:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/boyaa/engine/made/AppGLSurfaceView$1;

    .prologue
    .line 437
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;-><init>()V

    return-void
.end method

.method private getLuaEvent()Ljava/lang/Runnable;
    .locals 3

    .prologue
    .line 448
    sget-object v1, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventObj:Ljava/lang/Object;

    monitor-enter v1

    .line 449
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 450
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventQueue:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    monitor-exit v1

    .line 453
    :goto_0
    return-object v0

    .line 452
    :cond_0
    monitor-exit v1

    .line 453
    const/4 v0, 0x0

    goto :goto_0

    .line 452
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)Z
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 459
    :goto_0
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->getLuaEvent()Ljava/lang/Runnable;

    move-result-object v0

    .local v0, "r":Ljava/lang/Runnable;
    if-eqz v0, :cond_0

    .line 461
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 464
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/made/GhostLib;->update()Z

    move-result v1

    return v1
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 1
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 468
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mFirstChange:Z

    if-eqz v0, :cond_0

    .line 469
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mFirstChange:Z

    .line 470
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppActivity;->OnBeforeLuaLoad()V

    .line 471
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppActivity;->OnSetEnv()V

    .line 473
    :cond_0
    invoke-static {p2, p3}, Lcom/boyaa/engine/made/GhostLib;->create(II)V

    .line 474
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 477
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    const-string v1, "LuaThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 479
    return-void
.end method

.method public queueLuaEvent(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 442
    sget-object v1, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventObj:Ljava/lang/Object;

    monitor-enter v1

    .line 443
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->mLuaEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    monitor-exit v1

    .line 445
    return-void

    .line 444
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
