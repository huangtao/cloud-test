.class public Lcom/boyaa/videodemo/listener/AudioUdpListener;
.super Ljava/lang/Object;
.source "AudioUdpListener.java"

# interfaces
.implements Lcom/boyaa/videodemo/listener/TaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;
    }
.end annotation


# instance fields
.field private final PARSE_WATH:I

.field private TAG:Ljava/lang/String;

.field private mParseHandler:Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;-><init>(Lcom/boyaa/videodemo/listener/AudioUdpListener;Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener;->mParseHandler:Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener;->PARSE_WATH:I

    .line 28
    const-string v0, "AudioUdpListener"

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener;->TAG:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public audioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 9
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 99
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v6

    invoke-static {v6}, Lcom/example/tutorial/VideoProto$AudioNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v3

    .line 100
    .local v3, "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSendUserId()I

    move-result v5

    .line 101
    .local v5, "send_user_id":I
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSeatId()I

    move-result v4

    .line 102
    .local v4, "seat_id":I
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    .line 103
    .local v0, "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v2

    .line 106
    .local v2, "data":[B
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v6

    invoke-virtual {v6}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 108
    const-string v6, "AudioUdpListener"

    const-string v7, "\u63a5\u6536\u5230\u81ea\u5df1\u7684\u8bed\u97f3\u6570\u636e\uff0c\u65e0\u6548\u5904\u7406"

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .end local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .end local v2    # "data":[B
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .end local v4    # "seat_id":I
    .end local v5    # "send_user_id":I
    :goto_0
    return-void

    .line 111
    .restart local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .restart local v2    # "data":[B
    .restart local v3    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .restart local v4    # "seat_id":I
    .restart local v5    # "send_user_id":I
    :cond_0
    const-string v6, "AudioUdpListener"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "audio send_user_id ="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    new-instance v1, Lcom/boyaa/videodemo/bean/AudioBean;

    invoke-direct {v1}, Lcom/boyaa/videodemo/bean/AudioBean;-><init>()V

    .line 116
    .local v1, "bean":Lcom/boyaa/videodemo/bean/AudioBean;
    iput-object v2, v1, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    .line 117
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getTimeStamp()J

    move-result-wide v6

    iput-wide v6, v1, Lcom/boyaa/videodemo/bean/AudioBean;->timestamp:J

    .line 118
    iput v5, v1, Lcom/boyaa/videodemo/bean/AudioBean;->speaking_uid:I

    .line 137
    sget-object v6, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v6, v1}, Ljava/util/concurrent/ArrayBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 148
    .end local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .end local v1    # "bean":Lcom/boyaa/videodemo/bean/AudioBean;
    .end local v2    # "data":[B
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .end local v4    # "seat_id":I
    .end local v5    # "send_user_id":I
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method public failed(Ljava/lang/Exception;I)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "key"    # I

    .prologue
    .line 37
    return-void
.end method

.method public release(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 43
    return-void
.end method

.method public success([B)V
    .locals 5
    .param p1, "data"    # [B

    .prologue
    .line 50
    :try_start_0
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->parseFrom([B)Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v1

    .line 52
    .local v1, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener;->mParseHandler:Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 53
    .local v2, "msg":Landroid/os/Message;
    const/4 v3, 0x0

    iput v3, v2, Landroid/os/Message;->arg1:I

    .line 54
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 55
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v1    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener;->TAG:Ljava/lang/String;

    const-string v4, "parse video proto message err"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
