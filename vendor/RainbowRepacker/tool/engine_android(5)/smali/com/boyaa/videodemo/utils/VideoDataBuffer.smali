.class public Lcom/boyaa/videodemo/utils/VideoDataBuffer;
.super Ljava/lang/Object;
.source "VideoDataBuffer.java"


# static fields
.field public static mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

.field private static mLock:[B


# instance fields
.field private bNotFinish:Z

.field private data:[B

.field private iDataLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mLock:[B

    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->bNotFinish:Z

    .line 15
    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->bNotFinish:Z

    .line 16
    iput v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->iDataLength:I

    .line 17
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;
    .locals 2

    .prologue
    .line 20
    sget-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    if-nez v0, :cond_1

    .line 21
    sget-object v1, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mLock:[B

    monitor-enter v1

    .line 22
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    invoke-direct {v0}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    .line 21
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->mInstatnce:Lcom/boyaa/videodemo/utils/VideoDataBuffer;

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
.method public getData()[B
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->data:[B

    return-object v0
.end method

.method public getDataFin()Z
    .locals 1

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->bNotFinish:Z

    return v0
.end method

.method public getDataLength()I
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->iDataLength:I

    return v0
.end method

.method public setData([B)V
    .locals 0
    .param p1, "unHandleData"    # [B

    .prologue
    .line 54
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->data:[B

    .line 55
    return-void
.end method

.method public setDataFin(Z)V
    .locals 0
    .param p1, "bFin"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->bNotFinish:Z

    .line 50
    return-void
.end method

.method public setDataLength(I)V
    .locals 0
    .param p1, "iLen"    # I

    .prologue
    .line 34
    iput p1, p0, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->iDataLength:I

    .line 35
    return-void
.end method
