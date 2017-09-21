.class public Lcom/boyaa/videodemo/utils/EncoderTask;
.super Landroid/os/AsyncTask;
.source "EncoderTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private iDel:I

.field private mData:[B


# direct methods
.method constructor <init>([BI)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "del"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 8
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/videodemo/utils/EncoderTask;->iDel:I

    .line 11
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/EncoderTask;->mData:[B

    .line 12
    iput p2, p0, Lcom/boyaa/videodemo/utils/EncoderTask;->iDel:I

    .line 13
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/boyaa/videodemo/utils/EncoderTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 7
    .param p1, "arg0"    # [Ljava/lang/Void;

    .prologue
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 20
    .local v3, "start":J
    sget-object v5, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    iget-object v6, p0, Lcom/boyaa/videodemo/utils/EncoderTask;->mData:[B

    invoke-virtual {v5, v6}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 23
    .local v1, "end":J
    sub-long v3, v1, v3

    .line 25
    iget v5, p0, Lcom/boyaa/videodemo/utils/EncoderTask;->iDel:I

    int-to-long v5, v5

    sub-long v1, v5, v3

    .line 29
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-lez v5, :cond_0

    .line 30
    const-wide/16 v5, 0x32

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :cond_0
    :goto_0
    const/4 v5, 0x0

    return-object v5

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "Encoder"

    const-string v6, "Thread sleep exception!"

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
