.class public Lcom/boyaa/engine/made/AppGLSurfaceView;
.super Lcom/boyaa/engine/made/GLSurfaceView;
.source "AppGLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;,
        Lcom/boyaa/engine/made/AppGLSurfaceView$ConfigChooser;,
        Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final LUA_THREAD_NAME:Ljava/lang/String; = "LuaThread"

.field private static TAG:Ljava/lang/String;

.field private static createIndex:I


# instance fields
.field private mIsPaused:Z

.field private mMaxVelocity:I

.field private mPointerId:I

.field private mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-string v0, "GhostGLSurfaceView"

    sput-object v0, Lcom/boyaa/engine/made/AppGLSurfaceView;->TAG:Ljava/lang/String;

    .line 56
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    .line 66
    const/4 v0, 0x1

    const/16 v1, 0x10

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->init(ZII)V

    .line 67
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mMaxVelocity:I

    .line 68
    const-string v0, "history"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "max velocity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mMaxVelocity:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 77
    invoke-direct {p0, p1, p2}, Lcom/boyaa/engine/made/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    .line 78
    const/4 v0, 0x1

    const/16 v1, 0x10

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->init(ZII)V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZII)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "translucent"    # Z
    .param p3, "depth"    # I
    .param p4, "stencil"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    .line 73
    invoke-direct {p0, p2, p3, p4}, Lcom/boyaa/engine/made/AppGLSurfaceView;->init(ZII)V

    .line 74
    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/boyaa/engine/made/AppGLSurfaceView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300()I
    .locals 1

    .prologue
    .line 52
    sget v0, Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I

    return v0
.end method

.method static synthetic access$302(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 52
    sput p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->createIndex:I

    return p0
.end method

.method static synthetic access$400(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljavax/microedition/khronos/egl/EGL10;

    .prologue
    .line 52
    invoke-static {p0, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V

    return-void
.end method

.method private static checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 6
    .param p0, "prompt"    # Ljava/lang/String;
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;

    .prologue
    .line 236
    :goto_0
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .local v0, "error":I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 237
    sget-object v1, Lcom/boyaa/engine/made/AppGLSurfaceView;->TAG:Ljava/lang/String;

    const-string v2, "%s: EGL error: 0x%x"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 239
    :cond_0
    return-void
.end method

.method private init(ZII)V
    .locals 8
    .param p1, "translucent"    # Z
    .param p2, "depth"    # I
    .param p3, "stencil"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x5

    const/16 v1, 0x8

    .line 82
    if-eqz p1, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v2, -0x3

    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 86
    :cond_0
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;

    invoke-direct {v0, v7}, Lcom/boyaa/engine/made/AppGLSurfaceView$ContextFactory;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView$1;)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->setEGLContextFactory(Lcom/boyaa/engine/made/GLSurfaceView$EGLContextFactory;)V

    .line 88
    if-eqz p1, :cond_1

    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$ConfigChooser;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/boyaa/engine/made/AppGLSurfaceView$ConfigChooser;-><init>(IIIIII)V

    :goto_0
    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->setEGLConfigChooser(Lcom/boyaa/engine/made/GLSurfaceView$EGLConfigChooser;)V

    .line 93
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    invoke-direct {v0, v7}, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView$1;)V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    .line 94
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->setRenderer(Lcom/boyaa/engine/made/GLSurfaceView$Renderer;)V

    .line 95
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    .line 96
    return-void

    .line 88
    :cond_1
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$ConfigChooser;

    const/4 v2, 0x6

    const/4 v4, 0x0

    move v1, v5

    move v3, v5

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/boyaa/engine/made/AppGLSurfaceView$ConfigChooser;-><init>(IIIIII)V

    goto :goto_0
.end method


# virtual methods
.method public isGLThread()Z
    .locals 2

    .prologue
    .line 214
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LuaThread"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 194
    const-string v1, "GLSurfaceView"

    const-string v2, "KeyDown"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    move v0, p1

    .line 197
    .local v0, "key":I
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 198
    new-instance v1, Lcom/boyaa/engine/made/AppGLSurfaceView$7;

    invoke-direct {v1, p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView$7;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;I)V

    invoke-virtual {p0, v1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 204
    const/4 v1, 0x1

    .line 206
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, v0, p2}, Lcom/boyaa/engine/made/GLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 106
    invoke-super {p0}, Lcom/boyaa/engine/made/GLSurfaceView;->onPause()V

    .line 108
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    if-eqz v0, :cond_0

    .line 119
    :goto_0
    return-void

    .line 112
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    .line 113
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$1;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/made/AppGLSurfaceView$1;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 123
    invoke-super {p0}, Lcom/boyaa/engine/made/GLSurfaceView;->onResume()V

    .line 125
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    if-nez v0, :cond_0

    .line 135
    :goto_0
    return-void

    .line 128
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mIsPaused:Z

    .line 129
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$2;

    invoke-direct {v0, p0}, Lcom/boyaa/engine/made/AppGLSurfaceView$2;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x0

    .line 139
    iget-object v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_0

    .line 140
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 144
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 145
    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 146
    .local v3, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 148
    .local v4, "time":J
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 189
    :goto_0
    return v0

    .line 150
    :pswitch_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mPointerId:I

    .line 151
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/made/AppGLSurfaceView$3;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJ)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 189
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 159
    :pswitch_1
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 160
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mPointerId:I

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v6

    .line 161
    .local v6, "velocityX":F
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mPointerId:I

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v7

    .line 162
    .local v7, "velocityY":F
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/boyaa/engine/made/AppGLSurfaceView$4;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJFF)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 170
    .end local v6    # "velocityX":F
    .end local v7    # "velocityY":F
    :pswitch_2
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/made/AppGLSurfaceView$5;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJ)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 178
    :pswitch_3
    new-instance v0, Lcom/boyaa/engine/made/AppGLSurfaceView$6;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/made/AppGLSurfaceView$6;-><init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJ)V

    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 148
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public queueLuaEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView;->mRender:Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;

    invoke-virtual {v0, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView$Renderer;->queueLuaEvent(Ljava/lang/Runnable;)V

    .line 103
    :cond_0
    return-void
.end method

.method public runOnGLThread(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 210
    invoke-virtual {p0, p1}, Lcom/boyaa/engine/made/AppGLSurfaceView;->queueLuaEvent(Ljava/lang/Runnable;)V

    .line 211
    return-void
.end method
