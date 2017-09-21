.class public Lcom/boyaa/videodemo/bean/VedioFrameBean;
.super Ljava/lang/Object;
.source "VedioFrameBean.java"


# instance fields
.field public iLastDataDisplay:I

.field public iLastDataType:I

.field public iLastPackageCount:I

.field public iLastPackageNum:I

.field public msgList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataType:I

    .line 13
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataDisplay:I

    .line 14
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    .line 15
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageNum:I

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    .line 10
    return-void
.end method


# virtual methods
.method public Clean()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 146
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataType:I

    .line 147
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataDisplay:I

    .line 148
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    .line 149
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageNum:I

    .line 151
    iget-object v0, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 152
    return-void
.end method

.method public getFrameData()[B
    .locals 4

    .prologue
    .line 120
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 123
    .local v2, "msgBuffer":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-lt v1, v3, :cond_0

    .line 134
    :goto_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 125
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 128
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    goto :goto_1
.end method

.method public pushData(IIII[B)I
    .locals 5
    .param p1, "iDataType"    # I
    .param p2, "iDataDisplayType"    # I
    .param p3, "iPackageCount"    # I
    .param p4, "iPackageIndex"    # I
    .param p5, "msg"    # [B

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x4

    const/4 v1, -0x1

    .line 23
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/videodemo/utils/CacheRef;->getAudioVideoType()I

    move-result v0

    .line 24
    .local v0, "iValue":I
    const/4 v2, 0x6

    if-ne v0, v2, :cond_1

    .line 83
    :cond_0
    :goto_0
    return v1

    .line 28
    :cond_1
    const/16 v2, 0xa

    if-eq v0, v2, :cond_2

    if-ne v0, v4, :cond_4

    .line 30
    :cond_2
    if-eq p2, v3, :cond_0

    .line 43
    :cond_3
    iget v2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    if-nez v2, :cond_6

    .line 45
    if-nez p4, :cond_0

    .line 48
    iput p1, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataType:I

    .line 49
    iput p2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataDisplay:I

    .line 50
    iput p3, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    .line 51
    iput p4, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageNum:I

    .line 52
    iget-object v1, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    invoke-virtual {v1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    :goto_1
    add-int/lit8 v1, p3, -0x1

    if-ne p4, v1, :cond_7

    .line 81
    const/4 v1, 0x1

    goto :goto_0

    .line 35
    :cond_4
    const/4 v2, 0x7

    if-eq v0, v2, :cond_5

    if-ne v0, v3, :cond_3

    .line 37
    :cond_5
    if-ne p2, v4, :cond_3

    goto :goto_0

    .line 56
    :cond_6
    iget v2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataType:I

    if-ne p1, v2, :cond_0

    .line 60
    iget v2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataDisplay:I

    if-ne p2, v2, :cond_0

    .line 64
    iget v2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    if-ne p3, v2, :cond_0

    .line 68
    iget v2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageNum:I

    if-le p4, v2, :cond_0

    if-ge p4, p3, :cond_0

    .line 73
    iput p1, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataType:I

    .line 74
    iput p2, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastDataDisplay:I

    .line 75
    iput p3, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageCount:I

    .line 76
    iput p4, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->iLastPackageNum:I

    .line 77
    iget-object v1, p0, Lcom/boyaa/videodemo/bean/VedioFrameBean;->msgList:Ljava/util/ArrayList;

    invoke-virtual {v1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 83
    :cond_7
    const/4 v1, 0x0

    goto :goto_0
.end method
