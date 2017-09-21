.class public Lcom/boyaa/godsdk/callback/DefaultPushListener;
.super Ljava/lang/Object;
.source "DefaultPushListener.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/PushListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAddAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 18
    return-void
.end method

.method public onAddAliasSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 13
    return-void
.end method

.method public onRemoveAliasFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 28
    return-void
.end method

.method public onRemoveAliasSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 23
    return-void
.end method

.method public onRemoveTagsFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 48
    return-void
.end method

.method public onRemoveTagsSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 43
    return-void
.end method

.method public onSetTagsFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 38
    return-void
.end method

.method public onSetTagsSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 33
    return-void
.end method
