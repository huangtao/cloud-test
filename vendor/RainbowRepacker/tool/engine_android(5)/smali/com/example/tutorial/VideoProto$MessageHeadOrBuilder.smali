.class public interface abstract Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;
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
    name = "MessageHeadOrBuilder"
.end annotation


# virtual methods
.method public abstract getAuthKey()Ljava/lang/String;
.end method

.method public abstract getAuthKeyBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getClientVersion()I
.end method

.method public abstract getMessageBodyName()Ljava/lang/String;
.end method

.method public abstract getMessageBodyNameBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getUserId()I
.end method

.method public abstract hasAuthKey()Z
.end method

.method public abstract hasClientVersion()Z
.end method

.method public abstract hasMessageBodyName()Z
.end method

.method public abstract hasUserId()Z
.end method
