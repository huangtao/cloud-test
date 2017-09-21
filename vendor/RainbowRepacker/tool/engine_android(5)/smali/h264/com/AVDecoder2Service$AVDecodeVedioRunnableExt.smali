.class Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;
.super Ljava/lang/Object;
.source "AVDecoder2Service.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lh264/com/AVDecoder2Service;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AVDecodeVedioRunnableExt"
.end annotation


# instance fields
.field final synthetic this$0:Lh264/com/AVDecoder2Service;


# direct methods
.method constructor <init>(Lh264/com/AVDecoder2Service;)V
    .locals 0

    .prologue
    .line 94
    iput-object p1, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 100
    :try_start_0
    const-string v10, "AVDecoderOtherService"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "start run DecodeAACRunnable :  "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    # getter for: Lh264/com/AVDecoder2Service;->isDecoderVedioThread:Z
    invoke-static {v12}, Lh264/com/AVDecoder2Service;->access$0(Lh264/com/AVDecoder2Service;)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    iget-object v10, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lh264/com/AVDecoder2Service;->access$1(Lh264/com/AVDecoder2Service;Z)V

    .line 103
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 104
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getVedioFrame()Lcom/boyaa/videodemo/bean/VedioFrameBean;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/bean/VedioFrameBean;->Clean()V

    .line 106
    :cond_0
    sget-object v10, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    if-eqz v10, :cond_1

    .line 107
    sget-object v10, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 111
    :cond_1
    const/4 v0, 0x1

    .line 112
    .local v0, "bFirstShow":Z
    const/4 v5, 0x0

    .line 114
    .local v5, "iFailedCount":I
    :cond_2
    :goto_0
    iget-object v10, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    # getter for: Lh264/com/AVDecoder2Service;->isDecoderVedioThread:Z
    invoke-static {v10}, Lh264/com/AVDecoder2Service;->access$0(Lh264/com/AVDecoder2Service;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v10

    if-nez v10, :cond_3

    .line 245
    const-string v10, "AVDecoderOtherService"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "end run DecodeVedioRunnable  :  "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    # getter for: Lh264/com/AVDecoder2Service;->isDecoderVedioThread:Z
    invoke-static {v12}, Lh264/com/AVDecoder2Service;->access$0(Lh264/com/AVDecoder2Service;)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .end local v0    # "bFirstShow":Z
    .end local v5    # "iFailedCount":I
    :goto_1
    return-void

    .line 115
    .restart local v0    # "bFirstShow":Z
    .restart local v5    # "iFailedCount":I
    :cond_3
    :try_start_1
    sget-object v10, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v10

    const/16 v11, 0x64

    if-lt v10, v11, :cond_4

    .line 117
    sget-object v10, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 242
    .end local v0    # "bFirstShow":Z
    .end local v5    # "iFailedCount":I
    :catch_0
    move-exception v2

    .line 243
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 245
    const-string v10, "AVDecoderOtherService"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "end run DecodeVedioRunnable  :  "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    # getter for: Lh264/com/AVDecoder2Service;->isDecoderVedioThread:Z
    invoke-static {v12}, Lh264/com/AVDecoder2Service;->access$0(Lh264/com/AVDecoder2Service;)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 121
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "bFirstShow":Z
    .restart local v5    # "iFailedCount":I
    :cond_4
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 122
    .local v8, "start":J
    sget-object v10, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v10}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->get_first_data()Lcom/boyaa/videodemo/bean/VedioBean;

    move-result-object v1

    .line 123
    .local v1, "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    const/4 v6, 0x0

    .line 124
    .local v6, "iResult":I
    const/16 v10, 0x1f4

    if-le v5, v10, :cond_5

    .line 126
    const/4 v5, 0x0

    .line 127
    goto :goto_0

    .line 130
    :cond_5
    if-eqz v1, :cond_6

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    if-eqz v10, :cond_6

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    if-eqz v10, :cond_6

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v10, v10

    const/4 v11, 0x3

    if-gt v10, v11, :cond_7

    .line 132
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 134
    const-wide/16 v10, 0x14

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 244
    .end local v0    # "bFirstShow":Z
    .end local v1    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .end local v5    # "iFailedCount":I
    .end local v6    # "iResult":I
    .end local v8    # "start":J
    :catchall_0
    move-exception v10

    .line 245
    const-string v11, "AVDecoderOtherService"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "end run DecodeVedioRunnable  :  "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v13, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    # getter for: Lh264/com/AVDecoder2Service;->isDecoderVedioThread:Z
    invoke-static {v13}, Lh264/com/AVDecoder2Service;->access$0(Lh264/com/AVDecoder2Service;)Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    throw v10

    .line 137
    .restart local v0    # "bFirstShow":Z
    .restart local v1    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .restart local v5    # "iFailedCount":I
    .restart local v6    # "iResult":I
    .restart local v8    # "start":J
    :cond_7
    :try_start_4
    const-string v10, "JetterSizeExt"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Buffer Data"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v12, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v12}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    sget v10, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    iget v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    if-ne v10, v11, :cond_b

    sget-object v10, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v10}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_b

    .line 140
    iget-wide v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    sget-wide v12, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    sub-long/2addr v10, v12

    long-to-int v7, v10

    .line 141
    .local v7, "iValue_Ext":I
    const-string v10, "JetterData Ext"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "--------------            "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v10, "Data Ext"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "video stamp"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "  audio time="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-wide v12, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    if-gez v7, :cond_8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v10

    const/16 v11, 0x1f4

    if-le v10, v11, :cond_8

    .line 146
    const-wide/16 v10, 0x1

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    .line 147
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v10

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Lh264/com/H264Android;->DecoderNalExt([BI[BI)I

    goto/16 :goto_0

    .line 151
    :cond_8
    const/16 v10, 0x1f4

    if-le v7, v10, :cond_9

    .line 154
    sget-wide v10, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-lez v10, :cond_a

    .line 156
    const/16 v10, 0x96

    if-le v7, v10, :cond_9

    .line 158
    int-to-long v10, v7

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    .line 182
    :cond_9
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v10

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Lh264/com/H264Android;->DecoderNalExt([BI[BI)I

    move-result v6

    .line 184
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 185
    .local v3, "end":J
    sub-long v8, v3, v8

    .line 187
    iget-object v10, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    iget-wide v10, v10, Lh264/com/AVDecoder2Service;->delta:J

    sub-long v3, v10, v8

    .line 188
    const-string v10, "JetterData audio"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "send time\uff1a"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " end time:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " || result value = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " data len="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 191
    const-wide/16 v10, 0x0

    cmp-long v10, v3, v10

    if-lez v10, :cond_2

    .line 192
    :try_start_5
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 193
    :catch_1
    move-exception v2

    .line 194
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_6
    const-string v10, "JetterData audio"

    const-string v11, "Thread sleep exception!"

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 163
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "end":J
    :cond_a
    const-string v10, "JetterData Ext"

    const-string v11, "iVoicePlay iVoicePlay iVoicePlay0000"

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v10

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Lh264/com/H264Android;->DecoderNalExt([BI[BI)I

    move-result v6

    .line 167
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 168
    .restart local v3    # "end":J
    sub-long v8, v3, v8

    .line 170
    iget-object v10, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    iget-wide v10, v10, Lh264/com/AVDecoder2Service;->delta:J

    sub-long v3, v10, v8

    .line 171
    const-string v10, "JetterData code"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "send time\uff1a"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " end time:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " || result value = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " data len="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 174
    const-wide/16 v10, 0x0

    cmp-long v10, v3, v10

    if-lez v10, :cond_2

    .line 175
    :try_start_7
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 176
    :catch_2
    move-exception v2

    .line 177
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_8
    const-string v10, "JetterData code"

    const-string v11, "Thread sleep exception!"

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 201
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "end":J
    .end local v7    # "iValue_Ext":I
    :cond_b
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v10

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Lh264/com/H264Android;->DecoderNalExt([BI[BI)I

    move-result v6

    .line 203
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 204
    .restart local v3    # "end":J
    sub-long v8, v3, v8

    .line 206
    iget-object v10, p0, Lh264/com/AVDecoder2Service$AVDecodeVedioRunnableExt;->this$0:Lh264/com/AVDecoder2Service;

    iget-wide v10, v10, Lh264/com/AVDecoder2Service;->delta:J

    sub-long v3, v10, v8

    .line 207
    const-string v10, "Jetter normal"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "send time\uff1a"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " end time:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " || result value = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " data len="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    array-length v12, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 210
    const-wide/16 v10, 0x0

    cmp-long v10, v3, v10

    if-lez v10, :cond_2

    .line 211
    :try_start_9
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 212
    :catch_3
    move-exception v2

    .line 213
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_a
    const-string v10, "Jetter normal"

    const-string v11, "Thread sleep exception!"

    invoke-static {v10, v11}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_0
.end method
