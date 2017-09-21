.class public Lcom/boyaa/videodemo/utils/VideoView1;
.super Landroid/view/SurfaceView;
.source "VideoView1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;
    }
.end annotation


# instance fields
.field public mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

.field public mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;III)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "iW"    # I
    .param p3, "iH"    # I
    .param p4, "iTag"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-direct {p0, p2, p3, p4}, Lcom/boyaa/videodemo/utils/VideoView1;->InitSurfaceView(III)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;III)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "iW"    # I
    .param p4, "iH"    # I
    .param p5, "iTag"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    invoke-direct {p0, p3, p4, p5}, Lcom/boyaa/videodemo/utils/VideoView1;->InitSurfaceView(III)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IIII)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "iW"    # I
    .param p5, "iH"    # I
    .param p6, "iTag"    # I

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    invoke-direct {p0, p4, p5, p6}, Lcom/boyaa/videodemo/utils/VideoView1;->InitSurfaceView(III)V

    .line 20
    return-void
.end method

.method private InitSurfaceView(III)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "tag"    # I

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/VideoView1;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 38
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 41
    new-instance v0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;-><init>(Lcom/boyaa/videodemo/utils/VideoView1;III)V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    .line 42
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 59
    return-void
.end method


# virtual methods
.method public ResetSurfaceParams(III)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "tag"    # I

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/VideoView1;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 64
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 65
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 70
    :cond_0
    new-instance v0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;-><init>(Lcom/boyaa/videodemo/utils/VideoView1;III)V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    .line 71
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mRemoteSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/VideoView1;->mBack:Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 73
    return-void
.end method
