.class Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;
.super Ljava/lang/Object;
.source "EncoderData.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/utils/EncoderData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AVEncodeVedioRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/utils/EncoderData;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/utils/EncoderData;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 79
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/EncoderData;->access$1(Lcom/boyaa/videodemo/utils/EncoderData;Z)V

    .line 81
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v2, :cond_0

    .line 82
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 86
    :cond_0
    const/4 v15, 0x1

    .line 87
    .local v15, "bFirstShow":Z
    const/16 v19, 0x0

    .line 90
    .local v19, "iFailedCount":I
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/EncoderData;->access$0(Lcom/boyaa/videodemo/utils/EncoderData;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_2

    .line 221
    const-string v2, "EncoderVedioThread"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "end run DecodeVedioRunnable  :  "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z
    invoke-static {v4}, Lcom/boyaa/videodemo/utils/EncoderData;->access$0(Lcom/boyaa/videodemo/utils/EncoderData;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .end local v15    # "bFirstShow":Z
    .end local v19    # "iFailedCount":I
    :goto_1
    return-void

    .line 92
    .restart local v15    # "bFirstShow":Z
    .restart local v19    # "iFailedCount":I
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    .line 94
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v2

    const/16 v3, 0xc8

    if-lt v2, v3, :cond_3

    .line 96
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 218
    .end local v15    # "bFirstShow":Z
    .end local v19    # "iFailedCount":I
    :catch_0
    move-exception v16

    .line 219
    .local v16, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 221
    const-string v2, "EncoderVedioThread"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "end run DecodeVedioRunnable  :  "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z
    invoke-static {v4}, Lcom/boyaa/videodemo/utils/EncoderData;->access$0(Lcom/boyaa/videodemo/utils/EncoderData;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 99
    .end local v16    # "e":Ljava/lang/Exception;
    .restart local v15    # "bFirstShow":Z
    .restart local v19    # "iFailedCount":I
    :cond_3
    :try_start_3
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 102
    .local v17, "end":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    sub-long v3, v17, v3

    iput-wide v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    .line 104
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->start:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    sub-long v17, v2, v4

    .line 106
    const-wide/16 v2, 0x0

    cmp-long v2, v17, v2

    if-lez v2, :cond_1

    .line 107
    const-wide/16 v2, 0x32

    :try_start_4
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 108
    :catch_1
    move-exception v16

    .line 109
    .restart local v16    # "e":Ljava/lang/Exception;
    :try_start_5
    const-string v2, "no audio"

    const-string v3, "Thread sleep exception!"

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 220
    .end local v15    # "bFirstShow":Z
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v17    # "end":J
    .end local v19    # "iFailedCount":I
    :catchall_0
    move-exception v2

    .line 221
    const-string v3, "EncoderVedioThread"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "end run DecodeVedioRunnable  :  "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z
    invoke-static {v5}, Lcom/boyaa/videodemo/utils/EncoderData;->access$0(Lcom/boyaa/videodemo/utils/EncoderData;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    throw v2

    .line 114
    .restart local v15    # "bFirstShow":Z
    .restart local v19    # "iFailedCount":I
    :cond_4
    :try_start_6
    sget-object v2, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v3, 0x1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 119
    .local v6, "bCarmeData":[B
    const/16 v2, 0x1f4

    move/from16 v0, v19

    if-le v0, v2, :cond_5

    .line 121
    const/16 v19, 0x0

    .line 122
    goto/16 :goto_0

    .line 125
    :cond_5
    if-nez v6, :cond_6

    .line 127
    add-int/lit8 v19, v19, 0x1

    .line 129
    const-wide/16 v2, 0x14

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_0

    .line 133
    :cond_6
    const-string v2, "CarmeData"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Buffer Data"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v4}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    iget v2, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_9

    .line 155
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    if-nez v2, :cond_8

    .line 157
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    const/4 v5, 0x1

    array-length v7, v6

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v8, v8, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    invoke-virtual/range {v2 .. v8}, Lh264/com/H264Encoder;->CompressBuffer(JI[BI[B)I

    move-result v2

    iput v2, v9, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    .line 177
    :goto_2
    const-string v2, "Encoder"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "iCount="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    if-lez v2, :cond_c

    .line 182
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    new-array v7, v2, [B

    .line 183
    .local v7, "h264Data":[B
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v5, v5, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    invoke-static {v2, v3, v7, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 185
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 186
    .local v10, "timestamp":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    if-nez v2, :cond_b

    .line 187
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    iget v8, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v9, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    const/4 v12, 0x1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->mFrameType:I
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/EncoderData;->access$2(Lcom/boyaa/videodemo/utils/EncoderData;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/EncoderData;->access$3(Lcom/boyaa/videodemo/utils/EncoderData;)I

    move-result v14

    invoke-static/range {v7 .. v14}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendVideoData([BIIJIII)V

    .line 191
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 192
    .restart local v17    # "end":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    sub-long v3, v17, v3

    iput-wide v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    .line 194
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    sub-long v17, v2, v4

    .line 195
    const-string v2, "Encoder"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "iCount="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " send time\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " end time:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v17

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " || result value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " data len="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v6

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 198
    const-wide/16 v2, 0x0

    cmp-long v2, v17, v2

    if-lez v2, :cond_7

    .line 199
    :try_start_7
    invoke-static/range {v17 .. v18}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 204
    :cond_7
    :goto_4
    :try_start_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    .line 205
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I
    invoke-static {v3}, Lcom/boyaa/videodemo/utils/EncoderData;->access$3(Lcom/boyaa/videodemo/utils/EncoderData;)I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 206
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    const/4 v3, 0x0

    iput v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    goto/16 :goto_0

    .line 160
    .end local v7    # "h264Data":[B
    .end local v10    # "timestamp":J
    .end local v17    # "end":J
    :cond_8
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    const/4 v5, 0x0

    array-length v7, v6

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v8, v8, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    invoke-virtual/range {v2 .. v8}, Lh264/com/H264Encoder;->CompressBuffer(JI[BI[B)I

    move-result v2

    iput v2, v9, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    goto/16 :goto_2

    .line 164
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    array-length v3, v6

    new-array v3, v3, [B

    iput-object v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    .line 165
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->iW:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v5, v5, Lcom/boyaa/videodemo/utils/EncoderData;->iH:I

    invoke-virtual {v2, v3, v6, v4, v5}, Lcom/boyaa/videodemo/utils/EncoderData;->YUV420spRotateNegative90([B[BII)V

    .line 167
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v2, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    if-nez v2, :cond_a

    .line 169
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v8, v3, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    const/4 v10, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v11, v3, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    array-length v12, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v13, v3, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    invoke-virtual/range {v7 .. v13}, Lh264/com/H264Encoder;->CompressBuffer(JI[BI[B)I

    move-result v3

    iput v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    .line 174
    :goto_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    goto/16 :goto_2

    .line 172
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v8, v3, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v11, v3, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v3, v3, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    array-length v12, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-object v13, v3, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    invoke-virtual/range {v7 .. v13}, Lh264/com/H264Encoder;->CompressBuffer(JI[BI[B)I

    move-result v3

    iput v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    goto :goto_5

    .line 189
    .restart local v7    # "h264Data":[B
    .restart local v10    # "timestamp":J
    :cond_b
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    iget v8, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v9, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->mFrameType:I
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/EncoderData;->access$2(Lcom/boyaa/videodemo/utils/EncoderData;)I

    move-result v13

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    # getter for: Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/EncoderData;->access$3(Lcom/boyaa/videodemo/utils/EncoderData;)I

    move-result v14

    invoke-static/range {v7 .. v14}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendVideoData([BIIJIII)V

    goto/16 :goto_3

    .line 200
    .restart local v17    # "end":J
    :catch_2
    move-exception v16

    .line 201
    .restart local v16    # "e":Ljava/lang/Exception;
    const-string v2, "Encoder"

    const-string v3, "Thread sleep exception!"

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 210
    .end local v7    # "h264Data":[B
    .end local v10    # "timestamp":J
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v17    # "end":J
    :cond_c
    const-string v2, "Encoder"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u7f16\u7801\u5931\u8d25 encoder="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget-wide v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " result = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    iget v4, v4, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;->this$0:Lcom/boyaa/videodemo/utils/EncoderData;

    const/4 v3, 0x0

    iput v3, v2, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0
.end method
