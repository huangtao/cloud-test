.class public Lcom/boyaa/videodemo/bean/VedioBean;
.super Ljava/lang/Object;
.source "VedioBean.java"


# instance fields
.field public bDecode:Z

.field public bShow:Z

.field public message:[B

.field public recording_uid:I

.field public timestamp:J

.field public vedioType:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-boolean v1, p0, Lcom/boyaa/videodemo/bean/VedioBean;->bShow:Z

    .line 7
    iput-boolean v1, p0, Lcom/boyaa/videodemo/bean/VedioBean;->bDecode:Z

    .line 8
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioBean;->vedioType:I

    .line 9
    iput v0, p0, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    .line 3
    return-void
.end method
