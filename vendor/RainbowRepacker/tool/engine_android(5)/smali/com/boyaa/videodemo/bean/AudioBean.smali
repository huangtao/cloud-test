.class public Lcom/boyaa/videodemo/bean/AudioBean;
.super Ljava/lang/Object;
.source "AudioBean.java"


# instance fields
.field public audioType:I

.field public bDecode:Z

.field public bShow:Z

.field public iSize:I

.field public m_buffer:[B

.field public speaking_uid:I

.field public timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput v0, p0, Lcom/boyaa/videodemo/bean/AudioBean;->iSize:I

    .line 8
    iput-boolean v1, p0, Lcom/boyaa/videodemo/bean/AudioBean;->bShow:Z

    .line 9
    iput-boolean v1, p0, Lcom/boyaa/videodemo/bean/AudioBean;->bDecode:Z

    .line 10
    iput v0, p0, Lcom/boyaa/videodemo/bean/AudioBean;->audioType:I

    .line 11
    iput v0, p0, Lcom/boyaa/videodemo/bean/AudioBean;->speaking_uid:I

    .line 3
    return-void
.end method
