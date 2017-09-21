.class Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;
.super Ljava/lang/Object;
.source "AVDecoder1Service.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lh264/com/AVDecoder1Service;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AVDecodeVedioRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lh264/com/AVDecoder1Service;


# direct methods
.method constructor <init>(Lh264/com/AVDecoder1Service;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 103
    :try_start_0
    const-string v8, "AVCodeerService"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "start run DecodeAACRunnable :  "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    # getter for: Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z
    invoke-static {v10}, Lh264/com/AVDecoder1Service;->access$0(Lh264/com/AVDecoder1Service;)Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    const/4 v9, 0x1

    invoke-static {v8, v9}, Lh264/com/AVDecoder1Service;->access$1(Lh264/com/AVDecoder1Service;Z)V

    .line 106
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 107
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getVedioFrame()Lcom/boyaa/videodemo/bean/VedioFrameBean;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/videodemo/bean/VedioFrameBean;->Clean()V

    .line 109
    :cond_0
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    if-eqz v8, :cond_1

    .line 110
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 114
    :cond_1
    const/4 v0, 0x1

    .line 115
    .local v0, "bFirstShow":Z
    const/4 v5, 0x0

    .line 117
    .local v5, "iFailedCount":I
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v8

    if-eqz v8, :cond_2

    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getVedioBufferSize()I

    move-result v8

    if-lez v8, :cond_2

    .line 119
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->Clean()V

    .line 122
    :cond_2
    :goto_0
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    # getter for: Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z
    invoke-static {v8}, Lh264/com/AVDecoder1Service;->access$0(Lh264/com/AVDecoder1Service;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_3

    .line 261
    const-string v8, "AVCodeerService"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "end run DecodeVedioRunnable  :  "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    # getter for: Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z
    invoke-static {v10}, Lh264/com/AVDecoder1Service;->access$0(Lh264/com/AVDecoder1Service;)Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .end local v0    # "bFirstShow":Z
    .end local v5    # "iFailedCount":I
    :goto_1
    return-void

    .line 124
    .restart local v0    # "bFirstShow":Z
    .restart local v5    # "iFailedCount":I
    :cond_3
    :try_start_1
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, v8, Lh264/com/AVDecoder1Service;->start:J

    .line 126
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v8

    const/16 v9, 0x64

    if-lt v8, v9, :cond_4

    .line 128
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 258
    .end local v0    # "bFirstShow":Z
    .end local v5    # "iFailedCount":I
    :catch_0
    move-exception v2

    .line 259
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 261
    const-string v8, "AVCodeerService"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "end run DecodeVedioRunnable  :  "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    # getter for: Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z
    invoke-static {v10}, Lh264/com/AVDecoder1Service;->access$0(Lh264/com/AVDecoder1Service;)Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 131
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "bFirstShow":Z
    .restart local v5    # "iFailedCount":I
    :cond_4
    :try_start_3
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v8

    if-nez v8, :cond_5

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 134
    .local v3, "end":J
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-object v9, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v9, v9, Lh264/com/AVDecoder1Service;->start:J

    sub-long v9, v3, v9

    iput-wide v9, v8, Lh264/com/AVDecoder1Service;->start:J

    .line 136
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v8, v8, Lh264/com/AVDecoder1Service;->delta:J

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    sub-long v3, v8, v10

    .line 138
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_2

    .line 139
    :try_start_4
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 140
    :catch_1
    move-exception v2

    .line 141
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_5
    const-string v8, "no audio"

    const-string v9, "Thread sleep exception!"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 260
    .end local v0    # "bFirstShow":Z
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "end":J
    .end local v5    # "iFailedCount":I
    :catchall_0
    move-exception v8

    .line 261
    const-string v9, "AVCodeerService"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "end run DecodeVedioRunnable  :  "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    # getter for: Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z
    invoke-static {v11}, Lh264/com/AVDecoder1Service;->access$0(Lh264/com/AVDecoder1Service;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    throw v8

    .line 147
    .restart local v0    # "bFirstShow":Z
    .restart local v5    # "iFailedCount":I
    :cond_5
    :try_start_6
    sget-object v8, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v8}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->get_first_data()Lcom/boyaa/videodemo/bean/VedioBean;

    move-result-object v1

    .line 149
    .local v1, "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    const/16 v8, 0x1f4

    if-le v5, v8, :cond_6

    .line 151
    const/4 v5, 0x0

    .line 152
    goto/16 :goto_0

    .line 155
    :cond_6
    if-eqz v1, :cond_7

    iget-object v8, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    if-eqz v8, :cond_7

    iget-object v8, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v8, v8

    if-eqz v8, :cond_7

    iget-object v8, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v8, v8

    const/4 v9, 0x3

    if-gt v8, v9, :cond_8

    .line 157
    :cond_7
    add-int/lit8 v5, v5, 0x1

    .line 159
    const-wide/16 v8, 0x14

    invoke-static {v8, v9}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_0

    .line 162
    :cond_8
    const-string v8, "JetterSize"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Buffer Data"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v10, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    sget v8, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    iget v9, v1, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    if-ne v8, v9, :cond_d

    sget-object v8, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v8}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_d

    .line 165
    iget-wide v8, v1, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    sget-wide v10, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    sub-long v6, v8, v10

    .line 166
    .local v6, "iValue_Ext":J
    const-string v8, "JetterData Vedio"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "--------------            "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const-string v8, "Data diff"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "video stamp"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "  audio time="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-wide v10, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-gez v8, :cond_a

    .line 172
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    const-wide/16 v10, 0x1f4

    cmp-long v8, v8, v10

    if-lez v8, :cond_9

    .line 174
    const-string v8, "JetterData Vedio"

    const-string v9, "iValue_Ext is hugry"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const-wide/16 v8, 0x1

    invoke-static {v8, v9}, Landroid/os/SystemClock;->sleep(J)V

    .line 176
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v8

    iget-object v9, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Lh264/com/H264Android;->DecoderNal([BI[BI)I

    goto/16 :goto_0

    .line 179
    :cond_9
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    const-wide/16 v10, 0x1f4

    cmp-long v8, v8, v10

    if-gez v8, :cond_a

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    const-wide/16 v10, 0xc8

    cmp-long v8, v8, v10

    if-ltz v8, :cond_a

    .line 181
    const-wide/16 v8, 0x50

    invoke-static {v8, v9}, Landroid/os/SystemClock;->sleep(J)V

    .line 182
    const-string v8, "JetterData Vedio"

    const-string v9, "iValue_Ext is sleep"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v8

    iget-object v9, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Lh264/com/H264Android;->DecoderNal([BI[BI)I

    goto/16 :goto_0

    .line 189
    :cond_a
    const-wide/16 v8, 0x1f4

    cmp-long v8, v6, v8

    if-lez v8, :cond_b

    .line 192
    sget-wide v8, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_c

    .line 194
    const-string v8, "JetterData Vedio"

    const-string v9, "iValue_Ext is too large"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const-wide/16 v8, 0x96

    cmp-long v8, v6, v8

    if-lez v8, :cond_b

    .line 197
    invoke-static {v6, v7}, Landroid/os/SystemClock;->sleep(J)V

    .line 221
    :cond_b
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v11, v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Lh264/com/H264Android;->DecoderNal([BI[BI)I

    move-result v9

    iput v9, v8, Lh264/com/AVDecoder1Service;->iResult:I

    .line 222
    const-string v8, "JetterData Vedio"

    const-string v9, "iValue_Ext is normal"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 224
    .restart local v3    # "end":J
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-object v9, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v9, v9, Lh264/com/AVDecoder1Service;->start:J

    sub-long v9, v3, v9

    iput-wide v9, v8, Lh264/com/AVDecoder1Service;->start:J

    .line 226
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v8, v8, Lh264/com/AVDecoder1Service;->delta:J

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    sub-long v3, v8, v10

    .line 227
    const-string v8, "Decode R"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "send times1\uff1a"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " end time:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " || result value = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget v10, v10, Lh264/com/AVDecoder1Service;->iResult:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " data len="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 230
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_2

    .line 231
    :try_start_7
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 232
    :catch_2
    move-exception v2

    .line 233
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_8
    const-string v8, "normal video"

    const-string v9, "Thread sleep exception!"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 202
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "end":J
    :cond_c
    const-string v8, "JetterData Vedio"

    const-string v9, "iVoicePlay iVoicePlay iVoicePlay0000"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v11, v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Lh264/com/H264Android;->DecoderNal([BI[BI)I

    move-result v9

    iput v9, v8, Lh264/com/AVDecoder1Service;->iResult:I

    .line 206
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 207
    .restart local v3    # "end":J
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-object v9, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v9, v9, Lh264/com/AVDecoder1Service;->start:J

    sub-long v9, v3, v9

    iput-wide v9, v8, Lh264/com/AVDecoder1Service;->start:J

    .line 209
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v8, v8, Lh264/com/AVDecoder1Service;->delta:J

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    sub-long v3, v8, v10

    .line 210
    const-string v8, "Decode R"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "send times0\uff1a"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " end time:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " || result value = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget v10, v10, Lh264/com/AVDecoder1Service;->iResult:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " data len="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 213
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_2

    .line 214
    :try_start_9
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 215
    :catch_3
    move-exception v2

    .line 216
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_a
    const-string v8, "no audio"

    const-string v9, "Thread sleep exception!"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 238
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "end":J
    .end local v6    # "iValue_Ext":J
    :cond_d
    const-string v8, "Other Data"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Buffer Data"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v10, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v11, v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Lh264/com/H264Android;->DecoderNal([BI[BI)I

    move-result v9

    iput v9, v8, Lh264/com/AVDecoder1Service;->iResult:I

    .line 242
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 243
    .restart local v3    # "end":J
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-object v9, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v9, v9, Lh264/com/AVDecoder1Service;->start:J

    sub-long v9, v3, v9

    iput-wide v9, v8, Lh264/com/AVDecoder1Service;->start:J

    .line 245
    iget-object v8, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v8, v8, Lh264/com/AVDecoder1Service;->delta:J

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    sub-long v3, v8, v10

    .line 246
    const-string v8, "Decode R"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "send times2\uff1a"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget-wide v10, v10, Lh264/com/AVDecoder1Service;->start:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " end time:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " || result value = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;->this$0:Lh264/com/AVDecoder1Service;

    iget v10, v10, Lh264/com/AVDecoder1Service;->iResult:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " data len="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 249
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-lez v8, :cond_2

    .line 250
    :try_start_b
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_0

    .line 251
    :catch_4
    move-exception v2

    .line 252
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_c
    const-string v8, "Other Data"

    const-string v9, "Thread sleep exception!"

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_0
.end method
