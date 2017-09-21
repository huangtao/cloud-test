.class public Lh264/com/VideoEncodService;
.super Ljava/lang/Object;
.source "VideoEncodService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoEncodService"

.field private static mInstance:Lh264/com/VideoEncodService;

.field private static mLock:[B


# instance fields
.field public encoderDataThread:Lcom/boyaa/videodemo/utils/EncoderData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lh264/com/VideoEncodService;->mLock:[B

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static getInstance()Lh264/com/VideoEncodService;
    .locals 2

    .prologue
    .line 20
    sget-object v0, Lh264/com/VideoEncodService;->mInstance:Lh264/com/VideoEncodService;

    if-nez v0, :cond_1

    .line 21
    sget-object v1, Lh264/com/VideoEncodService;->mLock:[B

    monitor-enter v1

    .line 22
    :try_start_0
    sget-object v0, Lh264/com/VideoEncodService;->mInstance:Lh264/com/VideoEncodService;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lh264/com/VideoEncodService;

    invoke-direct {v0}, Lh264/com/VideoEncodService;-><init>()V

    sput-object v0, Lh264/com/VideoEncodService;->mInstance:Lh264/com/VideoEncodService;

    .line 21
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :cond_1
    sget-object v0, Lh264/com/VideoEncodService;->mInstance:Lh264/com/VideoEncodService;

    return-object v0

    .line 21
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 37
    sput-object v1, Lh264/com/VideoEncodService;->mInstance:Lh264/com/VideoEncodService;

    .line 39
    iget-object v0, p0, Lh264/com/VideoEncodService;->encoderDataThread:Lcom/boyaa/videodemo/utils/EncoderData;

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lh264/com/VideoEncodService;->encoderDataThread:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/EncoderData;->release()V

    .line 42
    :cond_0
    iput-object v1, p0, Lh264/com/VideoEncodService;->encoderDataThread:Lcom/boyaa/videodemo/utils/EncoderData;

    .line 44
    return-void
.end method

.method public startService(IIII)V
    .locals 1
    .param p1, "iW"    # I
    .param p2, "iH"    # I
    .param p3, "iType"    # I
    .param p4, "iTag"    # I

    .prologue
    .line 31
    new-instance v0, Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/boyaa/videodemo/utils/EncoderData;-><init>(IIII)V

    iput-object v0, p0, Lh264/com/VideoEncodService;->encoderDataThread:Lcom/boyaa/videodemo/utils/EncoderData;

    .line 32
    return-void
.end method
