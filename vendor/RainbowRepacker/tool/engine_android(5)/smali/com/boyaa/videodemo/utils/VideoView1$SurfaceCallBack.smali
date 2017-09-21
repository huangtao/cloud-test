.class public Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;
.super Ljava/lang/Object;
.source "VideoView1.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/utils/VideoView1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SurfaceCallBack"
.end annotation


# instance fields
.field public iH:I

.field public iTag:I

.field public iW:I

.field final synthetic this$0:Lcom/boyaa/videodemo/utils/VideoView1;


# direct methods
.method public constructor <init>(Lcom/boyaa/videodemo/utils/VideoView1;III)V
    .locals 0
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "tag"    # I

    .prologue
    .line 82
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/VideoView1;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput p2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    .line 84
    iput p3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    .line 85
    iput p4, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iTag:I

    .line 86
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 93
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 5
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v4, 0x2

    .line 98
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 99
    iget v0, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v1, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-interface {p1, v0, v1}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 101
    iget v0, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iTag:I

    packed-switch v0, :pswitch_data_0

    .line 125
    :goto_0
    return-void

    .line 104
    :pswitch_0
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface(Landroid/view/Surface;III)V

    goto :goto_0

    .line 107
    :pswitch_1
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurfaceExt(Landroid/view/Surface;III)V

    goto :goto_0

    .line 110
    :pswitch_2
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface3(Landroid/view/Surface;III)V

    goto :goto_0

    .line 113
    :pswitch_3
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface4(Landroid/view/Surface;III)V

    goto :goto_0

    .line 116
    :pswitch_4
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface5(Landroid/view/Surface;III)V

    goto :goto_0

    .line 119
    :pswitch_5
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface6(Landroid/view/Surface;III)V

    goto :goto_0

    .line 122
    :pswitch_6
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iW:I

    iget v3, p0, Lcom/boyaa/videodemo/utils/VideoView1$SurfaceCallBack;->iH:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lh264/com/H264Android;->setNativeSurface7(Landroid/view/Surface;III)V

    goto :goto_0

    .line 101
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 131
    return-void
.end method
