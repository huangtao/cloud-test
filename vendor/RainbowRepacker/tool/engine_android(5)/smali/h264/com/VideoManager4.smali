.class public Lh264/com/VideoManager4;
.super Ljava/lang/Object;
.source "VideoManager4.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VedioManager"

.field private static mInstance:Lh264/com/VideoManager4;

.field private static mLock:[B


# instance fields
.field public mCodec:Lh264/com/AVDecoder4Service;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lh264/com/VideoManager4;->mLock:[B

    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static getInstance()Lh264/com/VideoManager4;
    .locals 2

    .prologue
    .line 21
    sget-object v0, Lh264/com/VideoManager4;->mInstance:Lh264/com/VideoManager4;

    if-nez v0, :cond_1

    .line 22
    sget-object v1, Lh264/com/VideoManager4;->mLock:[B

    monitor-enter v1

    .line 23
    :try_start_0
    sget-object v0, Lh264/com/VideoManager4;->mInstance:Lh264/com/VideoManager4;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lh264/com/VideoManager4;

    invoke-direct {v0}, Lh264/com/VideoManager4;-><init>()V

    sput-object v0, Lh264/com/VideoManager4;->mInstance:Lh264/com/VideoManager4;

    .line 22
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :cond_1
    sget-object v0, Lh264/com/VideoManager4;->mInstance:Lh264/com/VideoManager4;

    return-object v0

    .line 22
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
    .line 42
    const-string v0, "VedioManager"

    const-string v1, "\u9000\u51fa\u8bed\u97f3\u5b50\u623f\u95f4,\u5173\u95ed\u8bed\u97f3\u64ad\u653e\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const/4 v0, 0x0

    sput-object v0, Lh264/com/VideoManager4;->mInstance:Lh264/com/VideoManager4;

    .line 45
    iget-object v0, p0, Lh264/com/VideoManager4;->mCodec:Lh264/com/AVDecoder4Service;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lh264/com/VideoManager4;->mCodec:Lh264/com/AVDecoder4Service;

    invoke-virtual {v0}, Lh264/com/AVDecoder4Service;->release()V

    .line 50
    :cond_0
    return-void
.end method

.method public startService()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lh264/com/AVDecoder4Service;

    invoke-direct {v0}, Lh264/com/AVDecoder4Service;-><init>()V

    iput-object v0, p0, Lh264/com/VideoManager4;->mCodec:Lh264/com/AVDecoder4Service;

    .line 33
    return-void
.end method
