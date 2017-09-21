.class public interface abstract Lcom/example/tutorial/VideoProto$LoginVideoRoomResponseOrBuilder;
.super Ljava/lang/Object;
.source "VideoProto.java"

# interfaces
.implements Lcom/google/protobuf/MessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LoginVideoRoomResponseOrBuilder"
.end annotation


# virtual methods
.method public abstract getAudioPort()I
.end method

.method public abstract getHeartBeat()I
.end method

.method public abstract getOtherPlayers(I)Lcom/example/tutorial/VideoProto$PlayerInfo;
.end method

.method public abstract getOtherPlayersCount()I
.end method

.method public abstract getOtherPlayersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getOtherPlayersOrBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
.end method

.method public abstract getOtherPlayersOrBuilderList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getProxyserverIp()Ljava/lang/String;
.end method

.method public abstract getProxyserverIpBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getProxyserverPort()I
.end method

.method public abstract getResult()Lcom/example/tutorial/VideoProto$ResultID;
.end method

.method public abstract getRoomId()I
.end method

.method public abstract getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
.end method

.method public abstract getSeatId()I
.end method

.method public abstract getSupportP2P()Z
.end method

.method public abstract getTimeStamp()J
.end method

.method public abstract getUpMicroUserId()I
.end method

.method public abstract getVideoPort()I
.end method

.method public abstract getWebrtcRoomserver()Ljava/lang/String;
.end method

.method public abstract getWebrtcRoomserverBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract hasAudioPort()Z
.end method

.method public abstract hasHeartBeat()Z
.end method

.method public abstract hasProxyserverIp()Z
.end method

.method public abstract hasProxyserverPort()Z
.end method

.method public abstract hasResult()Z
.end method

.method public abstract hasRoomId()Z
.end method

.method public abstract hasRoomType()Z
.end method

.method public abstract hasSeatId()Z
.end method

.method public abstract hasSupportP2P()Z
.end method

.method public abstract hasTimeStamp()Z
.end method

.method public abstract hasUpMicroUserId()Z
.end method

.method public abstract hasVideoPort()Z
.end method

.method public abstract hasWebrtcRoomserver()Z
.end method
