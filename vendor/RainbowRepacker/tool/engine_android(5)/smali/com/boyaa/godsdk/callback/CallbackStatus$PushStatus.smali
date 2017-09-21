.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$PushStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "PushStatus"
.end annotation


# static fields
.field public static final ADD_ALIAS_FAILED:I = 0x9ca4

.field public static final ADD_ALIAS_NOT_SUPPORT:I = 0x9ca5

.field public static final ADD_ALIAS_SUCCESS:I = 0x9c40

.field public static final PUSH_STATUS_START:I = 0x9c40

.field public static final REMOVE_ALIAS_FAILED:I = 0x9d6c

.field public static final REMOVE_ALIAS_NOT_SUPPORT:I = 0x9d6d

.field public static final REMOVE_ALIAS_SUCCESS:I = 0x9d08

.field public static final REMOVE_TAGS_FAILED:I = 0x9efc

.field public static final REMOVE_TAGS_NOT_SUPPORT:I = 0x9efd

.field public static final REMOVE_TAGS_SUCCESS:I = 0x9e98

.field public static final SET_TAGS_FAILED:I = 0x9e34

.field public static final SET_TAGS_NOT_SUPPORT:I = 0x9e35

.field public static final SET_TAGS_SUCCESS:I = 0x9dd0


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 150
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$PushStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
