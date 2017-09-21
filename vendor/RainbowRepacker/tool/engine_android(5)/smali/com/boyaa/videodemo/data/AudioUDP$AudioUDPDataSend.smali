.class Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;
.super Ljava/lang/Object;
.source "AudioUDP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/AudioUDP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AudioUDPDataSend"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/AudioUDP;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/AudioUDP;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 104
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/data/AudioUDP;->access$0(Lcom/boyaa/videodemo/data/AudioUDP;Z)V

    .line 105
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    if-nez v3, :cond_2

    .line 141
    :goto_0
    return-void

    .line 109
    :cond_0
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    if-nez v3, :cond_1

    .line 111
    const-string v3, "AudioUDP"

    const-string v4, "udp broken!!!"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 137
    :catch_0
    move-exception v2

    .line 139
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "UDPERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "a err "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 114
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    const-string v3, "AudioUDP"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SendBuf size="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v5}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    sget-object v3, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v3, :cond_3

    sget-object v3, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v3

    if-nez v3, :cond_3

    .line 117
    const-wide/16 v3, 0x2

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 107
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->bSending:Z
    invoke-static {v3}, Lcom/boyaa/videodemo/data/AudioUDP;->access$2(Lcom/boyaa/videodemo/data/AudioUDP;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 121
    :cond_3
    sget-object v3, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v4, 0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 125
    .local v0, "data":[B
    :try_start_2
    new-instance v1, Ljava/net/DatagramPacket;

    array-length v3, v0

    iget-object v4, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->serverAddr:Ljava/net/InetAddress;
    invoke-static {v4}, Lcom/boyaa/videodemo/data/AudioUDP;->access$3(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/InetAddress;

    move-result-object v4

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/videodemo/utils/CacheRef;->getAudioProt()I

    move-result v5

    invoke-direct {v1, v0, v3, v4, v5}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 126
    .local v1, "dp":Ljava/net/DatagramPacket;
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/AudioUDP;

    # getter for: Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/AudioUDP;->access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 134
    const-wide/16 v3, 0x2

    :try_start_3
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_1

    .line 128
    .end local v1    # "dp":Ljava/net/DatagramPacket;
    :catch_1
    move-exception v2

    .line 130
    .restart local v2    # "e":Ljava/lang/Exception;
    const-string v3, "UDPERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "a network "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method
