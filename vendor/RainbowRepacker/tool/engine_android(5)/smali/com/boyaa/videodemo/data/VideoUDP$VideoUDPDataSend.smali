.class Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;
.super Ljava/lang/Object;
.source "VideoUDP.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/VideoUDP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VideoUDPDataSend"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/VideoUDP;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/VideoUDP;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 91
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/data/VideoUDP;->access$0(Lcom/boyaa/videodemo/data/VideoUDP;Z)V

    .line 92
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    if-nez v3, :cond_2

    .line 128
    :goto_0
    return-void

    .line 96
    :cond_0
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    if-nez v3, :cond_1

    .line 98
    const-string v3, "VideoUDP"

    const-string v4, "udp broken!!!"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v2

    .line 126
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "UDPERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "err "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 102
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    sget-object v3, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v3, :cond_3

    sget-object v3, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v3

    if-nez v3, :cond_3

    .line 104
    const-wide/16 v3, 0x2

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 94
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->bSending:Z
    invoke-static {v3}, Lcom/boyaa/videodemo/data/VideoUDP;->access$2(Lcom/boyaa/videodemo/data/VideoUDP;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 107
    :cond_3
    const-string v3, "VideoUDP"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SendBuf size="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v5}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    sget-object v3, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v4, 0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 112
    .local v0, "data":[B
    :try_start_2
    new-instance v1, Ljava/net/DatagramPacket;

    array-length v3, v0

    iget-object v4, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->serverAddr:Ljava/net/InetAddress;
    invoke-static {v4}, Lcom/boyaa/videodemo/data/VideoUDP;->access$3(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/InetAddress;

    move-result-object v4

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/videodemo/utils/CacheRef;->getVideoProt()I

    move-result v5

    invoke-direct {v1, v0, v3, v4, v5}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 113
    .local v1, "dp":Ljava/net/DatagramPacket;
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;->this$0:Lcom/boyaa/videodemo/data/VideoUDP;

    # getter for: Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;
    invoke-static {v3}, Lcom/boyaa/videodemo/data/VideoUDP;->access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 121
    const-wide/16 v3, 0x2

    :try_start_3
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_1

    .line 115
    .end local v1    # "dp":Ljava/net/DatagramPacket;
    :catch_1
    move-exception v2

    .line 117
    .restart local v2    # "e":Ljava/lang/Exception;
    const-string v3, "UDPERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "network "

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
