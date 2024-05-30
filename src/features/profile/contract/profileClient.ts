import { ArweaveId } from "@/features/arweave/lib/model";
import { MessageId } from "../../ao/lib/aoClient";
import { AoContractClient, createAoContractClient } from "../../ao/lib/aoContractClient";
import { ProfileInfoCreate, ProfileInfoKeyed, ProfileInfoUpdate } from "./model";
import { AoWallet } from "@/features/ao/lib/aoWallet";
import { connect } from "@permaweb/aoconnect";

export type ProfileClient = {
  aoContractClient: AoContractClient;

  // Reads
  readProfiles(profileIds: Array<ArweaveId>): Promise<ProfileInfoKeyed>;

  // Writes
  createProfile(profile: ProfileInfoCreate): Promise<MessageId>;
  updateProfile(profile: ProfileInfoUpdate): Promise<MessageId>;
}

// Placeholder
// TODO: Define these methods properly
export const createProfileClient = (
  aoContractClient: AoContractClient,
): ProfileClient => ({
  aoContractClient: aoContractClient,

  // Read
  readProfiles: (profileIds: Array<ArweaveId>) => aoContractClient.dryrunReadReplyOneJson<ProfileInfoKeyed>({
    tags: [{ name: "Action", value: "Profiles" }],
    data: JSON.stringify({
      ProfileIds: profileIds,
    }),
  }, /* ProfileInfoKeyed */),

  // Write
  createProfile: (profile: ProfileInfoCreate) => aoContractClient.message({
    tags: [{ name: "Action", value: "ProfileCreate" }],
    data: JSON.stringify(profile),
  }),
  updateProfile: (profile: ProfileInfoUpdate) => aoContractClient.message({
    tags: [{ name: "Action", value: "ProfileUpdate" }],
    data: JSON.stringify(profile),
  }),
});

export const createProfileClientForProcess = (wallet: AoWallet) => (processId: string) => {
  const aoContractClient = createAoContractClient(processId, connect(), wallet);
  return createProfileClient(aoContractClient);
}
