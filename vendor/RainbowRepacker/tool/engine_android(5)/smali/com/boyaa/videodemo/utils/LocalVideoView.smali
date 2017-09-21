.class public Lcom/boyaa/videodemo/utils/LocalVideoView;
.super Landroid/view/SurfaceView;
.source "LocalVideoView.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;
    }
.end annotation


# instance fields
.field public mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

.field private mPreviewRunning:Z

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "iType"    # I
    .param p3, "iTag"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z

    .line 47
    invoke-direct {p0, p2, p3}, Lcom/boyaa/videodemo/utils/LocalVideoView;->InitSurfaceView(II)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "iType"    # I
    .param p4, "iTag"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z

    .line 41
    invoke-direct {p0, p3, p4}, Lcom/boyaa/videodemo/utils/LocalVideoView;->InitSurfaceView(II)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;III)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "iType"    # I
    .param p5, "iTag"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z

    .line 35
    invoke-direct {p0, p4, p5}, Lcom/boyaa/videodemo/utils/LocalVideoView;->InitSurfaceView(II)V

    .line 36
    return-void
.end method

.method private InitSurfaceView(II)V
    .locals 4
    .param p1, "iType"    # I
    .param p2, "iTag"    # I

    .prologue
    .line 56
    const/4 v1, 0x0

    .line 57
    .local v1, "iW":I
    const/4 v0, 0x0

    .line 59
    .local v0, "iH":I
    if-nez p1, :cond_1

    .line 61
    const/16 v1, 0x160

    .line 62
    const/16 v0, 0x120

    .line 73
    :cond_0
    :goto_0
    invoke-static {}, Lh264/com/VideoEncodService;->getInstance()Lh264/com/VideoEncodService;

    move-result-object v2

    invoke-virtual {v2, v1, v0, p1, p2}, Lh264/com/VideoEncodService;->startService(IIII)V

    .line 75
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/LocalVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 77
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 78
    new-instance v2, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    invoke-direct {v2, p0, p1, p2}, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;-><init>(Lcom/boyaa/videodemo/utils/LocalVideoView;II)V

    iput-object v2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    .line 80
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v3, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    invoke-interface {v2, v3}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 81
    return-void

    .line 64
    :cond_1
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    .line 67
    const/16 v1, 0x140

    .line 68
    const/16 v0, 0xf0

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/utils/LocalVideoView;)Z
    .locals 1

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z

    return v0
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/utils/LocalVideoView;)Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/videodemo/utils/LocalVideoView;Z)V
    .locals 0

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z

    return-void
.end method


# virtual methods
.method public ResetSurfaceParams(II)V
    .locals 2
    .param p1, "type"    # I
    .param p2, "tag"    # I

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/LocalVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 92
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 93
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 98
    :cond_0
    new-instance v0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    invoke-direct {v0, p0, p1, p2}, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;-><init>(Lcom/boyaa/videodemo/utils/LocalVideoView;II)V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    .line 99
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/LocalVideoView;->mBack:Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 101
    return-void
.end method

.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 0
    .param p1, "arg0"    # [B
    .param p2, "arg1"    # Landroid/hardware/Camera;

    .prologue
    .line 87
    return-void
.end method
