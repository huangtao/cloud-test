.class public Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;
.super Ljava/lang/Object;
.source "LocalVideoView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/utils/LocalVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SurfaceCallBack"
.end annotation


# instance fields
.field public iH:I

.field public iTag:I

.field public iType:I

.field public iW:I

.field private mCamera:Landroid/hardware/Camera;

.field final synthetic this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;


# direct methods
.method public constructor <init>(Lcom/boyaa/videodemo/utils/LocalVideoView;II)V
    .locals 1
    .param p2, "type"    # I
    .param p3, "tag"    # I

    .prologue
    .line 113
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    .line 114
    iput p2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iType:I

    .line 115
    if-nez p2, :cond_1

    .line 119
    const/16 v0, 0x160

    iput v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iW:I

    .line 120
    const/16 v0, 0x120

    iput v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iH:I

    .line 141
    :cond_0
    :goto_0
    iput p3, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iTag:I

    .line 142
    return-void

    .line 128
    :cond_1
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 132
    const/16 v0, 0x140

    iput v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iW:I

    .line 133
    const/16 v0, 0xf0

    iput v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iH:I

    goto :goto_0
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 12
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 148
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    if-nez v6, :cond_0

    .line 199
    :goto_0
    return-void

    .line 151
    :cond_0
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;

    # getter for: Lcom/boyaa/videodemo/utils/LocalVideoView;->mPreviewRunning:Z
    invoke-static {v6}, Lcom/boyaa/videodemo/utils/LocalVideoView;->access$0(Lcom/boyaa/videodemo/utils/LocalVideoView;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 152
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->stopPreview()V

    .line 155
    :cond_1
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    .line 157
    .local v3, "p":Landroid/hardware/Camera$Parameters;
    iget v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iW:I

    iget v7, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iH:I

    invoke-virtual {v3, v6, v7}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 159
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    new-instance v7, Lcom/boyaa/videodemo/utils/EncoderVideoData;

    iget v8, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iW:I

    iget v9, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iH:I

    iget v10, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iType:I

    iget v11, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->iTag:I

    invoke-direct {v7, v8, v9, v10, v11}, Lcom/boyaa/videodemo/utils/EncoderVideoData;-><init>(IIII)V

    invoke-virtual {v6, v7}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 162
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 163
    .local v0, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    const/4 v6, 0x0

    invoke-static {v6, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 164
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v6

    iget-object v6, v6, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v5

    .line 165
    .local v5, "rotation":I
    const/4 v1, 0x0

    .line 166
    .local v1, "degrees":I
    packed-switch v5, :pswitch_data_0

    .line 182
    :goto_1
    iget v6, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v6, v1

    add-int/lit16 v6, v6, 0x168

    rem-int/lit16 v4, v6, 0x168

    .line 183
    .local v4, "result":I
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6, v4}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 184
    add-int/lit8 v6, v1, 0x2d

    div-int/lit8 v6, v6, 0x5a

    mul-int/lit8 v2, v6, 0x5a

    .line 185
    .local v2, "orientation":I
    iget v6, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v6, v2

    rem-int/lit16 v4, v6, 0x168

    .line 187
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setRotation(I)V

    .line 188
    const-string v6, "orientation"

    const-string v7, "portrait"

    invoke-virtual {v3, v6, v7}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    const-string v6, "rotation"

    const/16 v7, 0x5a

    invoke-virtual {v3, v6, v7}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 192
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 194
    :try_start_0
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    iget-object v7, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;

    # getter for: Lcom/boyaa/videodemo/utils/LocalVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;
    invoke-static {v7}, Lcom/boyaa/videodemo/utils/LocalVideoView;->access$1(Lcom/boyaa/videodemo/utils/LocalVideoView;)Landroid/view/SurfaceHolder;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_2
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v6}, Landroid/hardware/Camera;->startPreview()V

    .line 198
    iget-object v6, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LocalVideoView;->access$2(Lcom/boyaa/videodemo/utils/LocalVideoView;Z)V

    goto/16 :goto_0

    .line 168
    .end local v2    # "orientation":I
    .end local v4    # "result":I
    :pswitch_0
    const/4 v1, 0x0

    .line 169
    goto :goto_1

    .line 171
    :pswitch_1
    const/16 v1, 0x5a

    .line 172
    goto :goto_1

    .line 174
    :pswitch_2
    const/16 v1, 0xb4

    .line 175
    goto :goto_1

    .line 177
    :pswitch_3
    const/16 v1, 0x10e

    goto :goto_1

    .line 195
    .restart local v2    # "orientation":I
    .restart local v4    # "result":I
    :catch_0
    move-exception v6

    goto :goto_2

    .line 166
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 6
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 204
    const/4 v1, 0x0

    .line 206
    .local v1, "cameraCount":I
    new-instance v2, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v2}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 207
    .local v2, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v1

    .line 209
    const/4 v0, 0x0

    .local v0, "camIdx":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 219
    return-void

    .line 210
    :cond_0
    invoke-static {v0, v2}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 211
    iget v4, v2, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 213
    :try_start_0
    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v4

    iput-object v4, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 214
    :catch_0
    move-exception v3

    .line 215
    .local v3, "e":Ljava/lang/RuntimeException;
    invoke-virtual {v3}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_1
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v2, 0x0

    .line 224
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 226
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 227
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->this$0:Lcom/boyaa/videodemo/utils/LocalVideoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LocalVideoView;->access$2(Lcom/boyaa/videodemo/utils/LocalVideoView;Z)V

    .line 228
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 229
    iput-object v2, p0, Lcom/boyaa/videodemo/utils/LocalVideoView$SurfaceCallBack;->mCamera:Landroid/hardware/Camera;

    .line 232
    :cond_0
    invoke-static {}, Lh264/com/VideoEncodService;->getInstance()Lh264/com/VideoEncodService;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoEncodService;->release()V

    .line 233
    return-void
.end method
