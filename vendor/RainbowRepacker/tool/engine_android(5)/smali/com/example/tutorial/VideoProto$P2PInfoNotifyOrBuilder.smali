.class public interface abstract Lcom/example/tutorial/VideoProto$P2PInfoNotifyOrBuilder;
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
    name = "P2PInfoNotifyOrBuilder"
.end annotation


# virtual methods
.method public abstract getPlayerInfo(I)Lcom/example/tutorial/VideoProto$PlayerInfo;
.end method

.method public abstract getPlayerInfoCount()I
.end method

.method public abstract getPlayerInfoList()Ljava/util/List;
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

.method public abstract getPlayerInfoOrBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
.end method

.method public abstract getPlayerInfoOrBuilderList()Ljava/util/List;
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
